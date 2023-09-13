#include <gudhi/Flag_complex_edge_collapser.h>
#include <iostream>
#include <vector>
#include <tuple>
#include <fstream>
#include <sstream>

// Type definitions for GUDHI
using Filtration_value = float;
using Vertex_handle = int;
using Filtered_edge = std::tuple<Vertex_handle, Vertex_handle, Filtration_value>;
using Filtered_edge_list = std::vector<Filtered_edge>;

// Function to read CSV file into a vector of points
std::vector<std::pair<float, float>> readCSV(const std::string& filename) {
  std::vector<std::pair<float, float>> points;
  std::ifstream file(filename);
  std::string line;
  while (std::getline(file, line)) {
    std::stringstream ss(line);
    float x, y;
    ss >> x >> y;
    points.push_back({x, y});
  }
  return points;
}

// Function to calculate Chebyshev distance between two points
float chebyshev_distance(const std::pair<float, float>& p1, const std::pair<float, float>& p2) {
  return std::max(std::abs(p2.first - p1.first), std::abs(p2.second - p1.second));
}



// Function to create graph and assign filtration values
Filtered_edge_list createGraph(const std::vector<std::pair<float, float>>& points, float max_distance) {
  Filtered_edge_list graph;
  for (int i = 0; i < points.size(); ++i) {
    for (int j = i + 1; j < points.size(); ++j) {
      float distance = chebyshev_distance(points[i], points[j]);
      if (distance <= max_distance) {
        graph.push_back({i, j, distance});
      }
    }
  }
  return graph;
}

int main() {
  // Read points from CSV file
  auto points = readCSV("sierpinski_points.csv");

  // Create graph and assign filtration values
  float max_distance = 1.0;  // You can adjust this value
  Filtered_edge_list graph = createGraph(points, max_distance);

  // Perform edge collapse
  auto remaining_edges = Gudhi::collapse::flag_complex_collapse_edges(graph);

  // Display remaining edges
  for (auto filtered_edge_from_collapse : remaining_edges) {
    std::cout << "fn[" << std::get<0>(filtered_edge_from_collapse) << ", " << std::get<1>(filtered_edge_from_collapse)
              << "] = " << std::get<2>(filtered_edge_from_collapse) << std::endl;
  }

  return 0;
}