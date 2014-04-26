module.exports = function(grunt) {
  'use strict';

  var globalConfig = {
    client: 'atheycreek',
    password: 'Romans109'
  };

  grunt.initConfig({
    globalConfig: globalConfig,
    pkg: grunt.file.readJSON('package.json'),

    sass: {
      dist: {
        options: {
          outputStyle: 'compressed',
          includePaths: ['workspace/assets/scss/bourbon', 'workspace/assets/scss/neat']
        },
        files: {
          'workspace/assets/build/main.css': 'workspace/assets/scss/main.scss'
        }
      }
    },

    jshint : {
      all: [
        'workspace/assets/js/app.js'
      ]
    },

    concat: {
      options: {
        separator: ';'
      },
      dist: {
        src : [
          'bower_components/jquery/jquery.js',
          'bower_components/responsimage/responsimage.js',
          // 'workspace/assets/js/mediaelement.js',
          'workspace/assets/js/app.js',
          'workspace/assets/js/reftagger.js'],
        dest: 'workspace/assets/build/main.js'
      }
    },

    uglify: {
      options: {
        mangle: false
      },
      main: {
        files: {
          'workspace/assets/build/main.min.js': ['workspace/assets/build/main.js']
        }
      }
    },

    clean: [ "manifest/cache/*.jpg" ],

    watch: {
      grunt: { files: ['Gruntfile.js'] },

      sass: {
        files: 'workspace/assets/scss/**/*.scss',
        tasks: ['sass'],
        options: {
          livereload: true,
        }
      },
      js: {
        files: 'workspace/assets/js/**/*.js',
        tasks: ['js'],
        options: {
          livereload: true,
        }
      }
    },

    deployments: {
      options: {
        "backups_dir": "sql"
      },
      local: {
        "title": "Local",
        "database": "<%= globalConfig.client  %>",
        "user": "root",
        "pass": "",
        "host": "127.0.0.1",
        "url": ""
      },
      production: {
        "title": "Production",
        "database": "<%= globalConfig.client  %>",
        "user": "<%= globalConfig.client  %>",
        "pass": "<%= globalConfig.password  %>",
        "host": "localhost",
        "ssh_host": "athey@192.241.203.145",
        "ssh_port": "22222",
        "url": ""
      }
    }

  });

  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  grunt.registerTask('js', ['jshint', 'concat', 'uglify']);
  grunt.registerTask('core', ['sass', 'js']);
  grunt.registerTask('build', ['core']);
  grunt.registerTask('default', ['build','watch']);
}
