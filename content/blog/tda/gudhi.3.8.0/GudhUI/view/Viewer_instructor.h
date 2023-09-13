/*    This file is part of the Gudhi Library - https://gudhi.inria.fr/ - which is released under MIT.
 *    See file LICENSE or go to https://gudhi.inria.fr/licensing/ for full license details.
 *    Author(s):       David Salinas
 *
 *    Copyright (C) 2014 Inria
 *
 *    Modification(s):
 *      - YYYY/MM Author: Description of the modification
 */

#ifndef VIEW_VIEWER_INSTRUCTOR_H_
#define VIEW_VIEWER_INSTRUCTOR_H_

// todo do a viewer instructor that has directly a pointer to a QGLviewer and buffer ot not triangles

#include <QFileDialog>
#include <QKeyEvent>
#include <QGLViewer/camera.h>

#include <memory>
#include <utility>  // for pair<>

#include "model/Complex_typedefs.h"

#include "Projector3D.h"
#include "View_parameter.h"
#include "Viewer.h"

class Viewer;
class Viewer_parameter;

class Viewer_instructor : public QWidget {
  Q_OBJECT

  typedef Geometry_trait::Point_3 Point_3;
  typedef Complex::Point Point;
  typedef Complex::Vertex_handle Vertex_handle;
  typedef Complex::Edge_handle Edge_handle;
  typedef Complex::Simplex Simplex;

  Viewer* viewer_;
  View_parameter view_params_;
  const Complex& mesh_;
  std::unique_ptr<Projector3D> projector_;

 public:
  Viewer_instructor(QWidget* parent, Viewer* viewer, const Complex& mesh);

  void initialize_bounding_box();

  std::pair<Point, Point> compute_bounding_box_corners();

  void show_entire_scene();

  const qglviewer::Camera* camera() const;

  int width() const;
  int height() const;

  /**
   * to change display parameters
   */
  View_parameter& view_params();

 public:
  /**
   * gives instructions to the viewer
   */
  void give_instructions();

  void draw_edges();
  void draw_triangles();
  void draw_points();

  void draw_edge(const Point&, const Point&);

  void draw_point(const Point&);

  /**
   * set the right color of vertex/edge/triangle considering the view_params choice
   */
  void set_color_vertex(Vertex_handle vh);
  void set_color_edge(Edge_handle eh);

  void set_color_triangle(const Simplex& triangle);

 private:
  /**
   * Projection to 3D needed for the viewer.
   */
  Point_3 proj(const Point& p) const;

 public slots:
  void sceneChanged();
  void change_draw_vertices();
  void change_draw_edges();
  void change_draw_triangles();
  void change_light();
};

#endif  // VIEW_VIEWER_INSTRUCTOR_H_
