#include <gudhi/Alpha_complex.h>
// to construct a simplex_tree from alpha complex
#include <gudhi/Simplex_tree.h>

#include <CGAL/Epeck_d.h>

#include <iostream>
#include <vector>

// Explicit dimension 2 Epeck_d kernel
using Kernel = CGAL::Epeck_d< CGAL::Dimension_tag<3> >;
using Bare_point = Kernel::Point_d;
using Weighted_point = Kernel::Weighted_point_d;
using Vector_of_points = std::vector<Weighted_point>;

int main() {
  // ----------------------------------------------------------------------------
  // Init of a list of points and weights from a small molecule
  // ----------------------------------------------------------------------------
  Vector_of_points points;
  points.emplace_back(Bare_point(1, -1, -1), 4.);
  points.emplace_back(Bare_point(-1, 1, -1), 4.);
  points.emplace_back(Bare_point(-1, -1, 1), 4.);
  points.emplace_back(Bare_point(1, 1, 1),   4.);
  points.emplace_back(Bare_point(2, 2, 2),   1.);

  // ----------------------------------------------------------------------------
  // Init of an alpha complex from the list of points
  // ----------------------------------------------------------------------------
  Gudhi::alpha_complex::Alpha_complex<Kernel, true> alpha_complex_from_weighted_points(points);

  Gudhi::Simplex_tree<> simplex;
  if (alpha_complex_from_weighted_points.create_complex(simplex)) {
    // ----------------------------------------------------------------------------
    // Display information about the alpha complex
    // ----------------------------------------------------------------------------
    std::clog << "Weighted alpha complex is of dimension " << simplex.dimension() <<
        " - " << simplex.num_simplices() << " simplices - " <<
        simplex.num_vertices() << " vertices." << std::endl;

    std::clog << "Iterator on weighted alpha complex simplices in the filtration order, with [filtration value]:" << std::endl;
    for (auto f_simplex : simplex.filtration_simplex_range()) {
      std::clog << "   ( ";
      for (auto vertex : simplex.simplex_vertex_range(f_simplex)) {
        std::clog << vertex << " ";
      }
      std::clog << ") -> " << "[" << simplex.filtration(f_simplex) << "] ";
      std::clog << std::endl;
    }
  }
  return 0;
}
