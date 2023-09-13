/*    This file is part of the Gudhi Library - https://gudhi.inria.fr/ - which is released under MIT.
 *    See file LICENSE or go to https://gudhi.inria.fr/licensing/ for full license details.
 *    Author(s):       David Salinas
 *
 *    Copyright (C) 2014 Inria
 *
 *    Modification(s):
 *      - YYYY/MM Author: Description of the modification
 */

#ifndef GUI_MAINWINDOW_H_
#define GUI_MAINWINDOW_H_

// Workaround https://svn.boost.org/trac/boost/ticket/12534
#include <boost/container/flat_map.hpp>

#include <QMainWindow>
#include "ui_main_window.h"
#include "model/Model.h"
#include "view/Viewer_instructor.h"


class Menu_k_nearest_neighbors;
class Menu_uniform_neighbors;
class Menu_edge_contraction;
class Menu_persistence;

class MainWindow : public QMainWindow, public Ui::MainWindow {
  Q_OBJECT

 private:
  Model model_;
  Viewer_instructor* viewer_instructor_;
  Menu_k_nearest_neighbors* menu_k_nearest_neighbors_;
  Menu_uniform_neighbors* menu_uniform_neighbors_;
  Menu_edge_contraction* menu_edge_contraction_;
  Menu_persistence* menu_persistence_;

 public:
  MainWindow(QWidget* parent = 0);
  void connectActions();

  /**
   * compute the bounding box and calls update view
   */
  void init_view() const;
  void update_view() const;


 protected:
  void closeEvent(QCloseEvent *event);

  void keyPressEvent(QKeyEvent *event) { }

 public:
 public slots:
  /**
   * open a file chooser to choose an off to load
   */
  void off_file_open();

  void off_points_open();

  /**
   * open a file chooser to choose an off to save
   */
  void off_file_save();
  void off_points_save();

  void show_graph_stats();
  void show_complex_stats();
  void show_complex_dimension();


  void build_rips_menu();
  void build_rips(double alpha);
  void build_k_nearest_neighbors_menu();
  void build_k_nearest_neighbors(unsigned k);


  void contract_edge_menu();
  void contract_edges(unsigned num_collapses);


  void collapse_vertices();
  void collapse_edges();


  void uniform_noise();
  void lloyd();

  void show_homology_group();
  void show_euler_characteristic();
  void persistence_menu();
  void compute_persistence(int p, double threshold, int max_dim, double min_pers);
  void critical_points_menu();
  void is_manifold_menu();


 public:
 signals:
  void sceneChanged() const;
};


#endif  // GUI_MAINWINDOW_H_
