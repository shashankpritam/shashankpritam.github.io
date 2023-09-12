#include <gudhi/Flag_complex_edge_collapser.h>
#include <iostream>
#include <vector>
#include <tuple>

int main() {
  // Type definitions
  using Filtration_value = float;
  using Vertex_handle = short;
  using Filtered_edge = std::tuple<Vertex_handle, Vertex_handle, Filtration_value>;
  using Filtered_edge_list = std::vector<Filtered_edge>;

  // Define the graph
  Filtered_edge_list graph = {{0, 1, 1.}, {1, 2, 1.}, {2, 3, 1.}, {3, 0, 1.}, {0, 2, 2.}, {1, 3, 2.}};

  // Perform edge collapse
  auto remaining_edges = Gudhi::collapse::flag_complex_collapse_edges(graph);

  // Display remaining edges
  for (auto filtered_edge_from_collapse : remaining_edges) {
    std::cout << "fn[" << std::get<0>(filtered_edge_from_collapse) << ", " << std::get<1>(filtered_edge_from_collapse)
              << "] = " << std::get<2>(filtered_edge_from_collapse) << std::endl;
  }

  return 0;
}
