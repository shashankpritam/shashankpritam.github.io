/*    This file is part of the Gudhi Library - https://gudhi.inria.fr/ - which is released under MIT.
 *    See file LICENSE or go to https://gudhi.inria.fr/licensing/ for full license details.
 *    Author(s):       David Salinas
 *
 *    Copyright (C) 2014 Inria
 *
 *    Modification(s):
 *      - YYYY/MM Author: Description of the modification
 */

#ifndef UTILS_K_NEAREST_BUILDER_H_
#define UTILS_K_NEAREST_BUILDER_H_

#include <CGAL/Euclidean_distance.h>
#include <CGAL/Orthogonal_k_neighbor_search.h>
#include <CGAL/Search_traits_d.h>
#include <CGAL/Search_traits_adapter.h>
#include <CGAL/property_map.h>

#include <unordered_map>
#include <list>
#include <utility>

#include "utils/UI_utils.h"
#include "model/Complex_typedefs.h"

template<typename SkBlComplex> class K_nearest_builder {
 private:
  typedef Geometry_trait Kernel;
  typedef Point Point_d;
  typedef std::pair<Point_d, unsigned> Point_d_with_id;
  typedef CGAL::Search_traits_d<Kernel> Traits_base;
  typedef CGAL::Search_traits_adapter<Point_d_with_id, CGAL::First_of_pair_property_map<Point_d_with_id>,
      Traits_base> Traits;
  typedef CGAL::Orthogonal_k_neighbor_search<Traits> Neighbor_search;
  typedef Neighbor_search::Tree Tree;
  typedef Neighbor_search::Distance Distance;

  SkBlComplex& complex_;

 public:
  /**
   * @brief Modify complex to be the expansion of the k-nearest neighbor
   * symmetric graph.
   */
  K_nearest_builder(SkBlComplex& complex, unsigned k) : complex_(complex) {
    complex.keep_only_vertices();
    compute_edges(k);
  }

 private:
  double squared_eucl_distance(const Point& p1, const Point& p2) const {
    return Geometry_trait::Squared_distance_d()(p1, p2);
  }

  void compute_edges(unsigned k) {
    std::list<Point_d_with_id> points_with_id;
    for (auto v : complex_.vertex_range()) {
      Point_d_with_id point_v(complex_.point(v), v.vertex);
      points_with_id.push_back(point_v);
    }

    Tree tree(points_with_id.begin(), points_with_id.end());

    typedef typename SkBlComplex::Vertex_handle Vertex_handle;
    for (auto p : complex_.vertex_range()) {
      Neighbor_search search(tree, complex_.point(p), k + 1);
      for (auto it = ++search.begin(); it != search.end(); ++it) {
        Vertex_handle q(std::get<1>(it->first));
        if (p != q && complex_.contains_vertex(p) && complex_.contains_vertex(q))
          complex_.add_edge_without_blockers(p, q);
      }
    }
  }
};

#endif  // UTILS_K_NEAREST_BUILDER_H_
