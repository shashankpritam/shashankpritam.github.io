/*    This file is part of the Gudhi Library - https://gudhi.inria.fr/ - which is released under MIT.
 *    See file LICENSE or go to https://gudhi.inria.fr/licensing/ for full license details.
 *    Author(s):       David Salinas
 *
 *    Copyright (C) 2014 Inria
 *
 *    Modification(s):
 *      - YYYY/MM Author: Description of the modification
 */

#ifndef CONCEPT_SKELETON_BLOCKER_SKELETONBLOCKERDS_H_
#define CONCEPT_SKELETON_BLOCKER_SKELETONBLOCKERDS_H_

namespace Gudhi {

namespace skeleton_blocker {

/** \brief Concept for the template class passed for Skeleton_blocker_complex.
 * Most importantly, it contains the nodes for vertices and edges
 * (Graph_vertex and Graph_edge) that are stored in the simplicial 
 * complex. The user can redefine these classes to attach
 * additional information to vertices and edges.
 */
struct SkeletonBlockerDS {
  /**
   * @brief index that allows to find the vertex in the boost graph
   */
  typedef int boost_vertex_handle;

  /**
   * @brief Root_vertex_handle and Vertex_handle are similar to global and local vertex descriptor
   * used in <a href="https://www.boost.org/doc/libs/release/libs/graph/doc/subgraph.html">boost subgraphs</a>
   * and allow to localize a vertex of a subcomplex on its parent root complex.
   *
   * In gross, vertices are stored in a vector
   * and the Root_vertex_handle and Vertex_handle store indices of a vertex in this vector.
   *
   * For the root simplicial complex, the Root_vertex_handle and Vertex_handle of a vertex
   * are the same.
   *
   *
   * For a subcomplex L of a simplicial complex K, the local descriptor, ie the Vertex_handle, of a
   * vertex v (that belongs to L)  is its position in the vector of vertices
   * of the subcomplex L whereas its Root_vertex_handle (global descriptor) is the position of v in the vector of the
   * vertices of the root simplicial complex K.
   */
  struct Root_vertex_handle {
    boost_vertex_handle vertex;

    friend ostream& operator<<(ostream& o, const Root_vertex_handle & v);
  };

  /**
   * A Vertex_handle must be Default Constructible, Assignable and Equality Comparable.
   */
  struct Vertex_handle {
    boost_vertex_handle vertex;

    friend ostream& operator<<(ostream& o, const Vertex_handle & v);
  };

  /**
   * \brief The type of vertices that are stored the boost graph.
   * A Vertex must be Default Constructible and Equality Comparable.
   *
   */
  struct Graph_vertex {
    /** \brief Used to deactivate a vertex for example when contracting an edge.
     * It allows in some cases to remove the vertex at low cost.
     */
    void deactivate();

    /** \brief Used to activate a vertex.
     */
    void activate();

    /** \brief Tells if the vertex is active.
     */
    bool is_active() const;

    void set_id(Root_vertex_handle i);
    Root_vertex_handle get_id() const;
    virtual string to_string() const;
    friend ostream& operator<<(ostream& o, const Graph_vertex & v);
  };

  /**
   * \brief The type of edges that are stored the boost graph.
   * An Edge must be Default Constructible and Equality Comparable.
   */
  struct Graph_edge {
    /**
     * @brief Allows to modify vertices of the edge.
     */
    void setId(Root_vertex_handle a, Root_vertex_handle b);

    /**
     * @brief Returns the first vertex of the edge.
     */
    Root_vertex_handle first() const;

    /**
     * @brief Returns the second vertex of the edge.
     */
    Root_vertex_handle second() const;

    friend ostream& operator<<(ostream& o, const Simple_edge & v);
  };
};

}  // namespace skeleton_blocker

namespace skbl = skeleton_blocker;

}  // namespace Gudhi

#endif  // CONCEPT_SKELETON_BLOCKER_SKELETONBLOCKERDS_H_
