module.exports = function (grunt) {
  'use strict';

  // Load local NPM tasks automagically
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  grunt.initConfig({

    // JS Hint
    // =====================================================

    jshint : {
      all: [
        'workspace/assets/js/main.js'
      ]
    },

    // Recess
    // =====================================================

    recess: {
      dist: {
        options: {
          compile: true,
          compress: true
        },
        files: {
          'workspace/assets/css/main.css': ['workspace/assets/less/main.less']
        }
      }
    },

    // Concatenation
    // =====================================================

    concat: {
      options: {
        separator: ';'
      },
      dist: {
        src : [
          'workspace/assets/js/jquery.js',
          'workspace/assets/bootstrap/js/combined/2.2.1/bootstrap.min.js ',
          'workspace/assets/js/responsimage.js',
          'workspace/assets/js/mediaelement.js',
          'workspace/assets/js/main.js'],
        dest: 'workspace/assets/js/application.js'
      },
      symphony: {
        src : [
          'symphony/assets/js/jquery.js',
          'symphony/assets/js/symphony.js',
          'symphony/assets/js/symphony.collapsible.js',
          'symphony/assets/js/symphony.orderable.js',
          'symphony/assets/js/symphony.selectable.js',
          'symphony/assets/js/symphony.duplicator.js',
          'symphony/assets/js/symphony.tags.js',
          'symphony/assets/js/symphony.suggestions.js',
          'symphony/assets/js/symphony.pickable.js',
          'symphony/assets/js/symphony.timeago.js',
          'symphony/assets/js/symphony.notify.js',
          'symphony/assets/js/symphony.drawer.js',
          'symphony/assets/js/admin.js'
        ],
        dest: 'symphony/assets/js/_min/symphony.js'
      },
      css: {
        src : [
          'symphony/assets/css/symphony.css',
          'symphony/assets/css/symphony.legacy.css',
          'symphony/assets/css/symphony.grids.css',
          'symphony/assets/css/symphony.forms.css',
          'symphony/assets/css/symphony.tables.css',
          'symphony/assets/css/symphony.frames.css',
          'symphony/assets/css/symphony.tabs.css',
          'symphony/assets/css/symphony.drawers.css',
          'symphony/assets/css/symphony.associations.css',
          'symphony/assets/css/symphony.notices.css',
          'symphony/assets/css/admin.css'
        ],
        dest: 'symphony/assets/css/_min/symphony.min.css'
      }
    },

    // Uglify.js
    // =====================================================

    uglify: {
      options: {
        mangle: false
      },
      main: {
        files: {
          'workspace/assets/js/application.min.js': ['workspace/assets/js/application.js']
        }
      },
      symphony: {
        files: {
          'symphony/assets/js/_min/symphony.min.js': ['symphony/assets/js/_min/symphony.js']
        }
      }
    },

    // Clean
    // =====================================================

    clean: [ "manifest/cache/*.jpg" ],

    // Watch
    // =====================================================

    watch: {
      main: {
        files: ['**/*.less','**/*.js','!**/node_modules/**'],
        tasks: ['core'],
        options: {
          livereload: true,
        }
      }
    }


});

// Main task
grunt.registerTask('core', ['jshint', 'concat', 'uglify', 'recess']);
grunt.registerTask('wipe', ['clean']);
grunt.registerTask('build', ['core']);
grunt.registerTask('default', ['build', 'watch'])};
