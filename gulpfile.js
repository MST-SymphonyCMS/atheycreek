// ================================================
// + ATHEY CREEK -- Gulp Configuration
// ================================================


// ------------------------------------------------
// + GULP PLUGINS
// ------------------------------------------------

var gulp = require('gulp'),
    sass = require('gulp-sass'),
    autoprefixer = require('gulp-autoprefixer'),
    minifyCSS = require('gulp-minify-css'),
    jshint = require('gulp-jshint'),
    uglify = require('gulp-uglify'),
    imagemin = require('gulp-imagemin'),
    rename = require('gulp-rename'),
    concat = require('gulp-concat'),
    clean = require('gulp-clean'),
    notify = require('gulp-notify'),
    cache = require('gulp-cache'),
    livereload = require('gulp-livereload'),
    gulpif = require('gulp-if');

// ------------------------------------------------
// + NODE PLUGINS
// ------------------------------------------------

var fontcustom = require('fontcustom'),
    sprite = require('css-sprite').stream;

// ------------------------------------------------
// + VARIABLES & PATHS
// ------------------------------------------------

var repo = 'https://github.com/atheycreek/atheycreek';
var source_path = 'workspace/assets/source';
var build_path = 'workspace/assets/build';
var template_path = 'workspace/xsl';
var utility_path = 'workspace/utilities';
var bower_path = 'bower_components';
var paths = {
  styles: [
    source_path + '/styles/main.scss'
  ],
  scripts: [
    bower_path + '/jquery/dist/jquery.js',
    bower_path + '/bootstrap*/assets/javascripts/bootstrap.js',
    bower_path + '/fastclick/lib/fastclick.js',
    bower_path + '/snapjs/snap.js',
    bower_path + '/unslider/src/unslider.js',
    bower_path + '/fitvids/*fitvids.js',
    bower_path + '/sharrre/*sharrre.js',
    source_path + '/scripts/main.js'
  ],
  images: [
    source_path + '/images/**/*'
  ],
  audio: [
    source_path + '/media/audio/**/*'
  ],
  sprites: [
    source_path + '/media/sprite/*.png'
  ],
  clean: [
    build_path + '/styles/',
    build_path + '/scripts/',
    build_path + '/images/'
  ]
};

// ------------------------------------------------
// + STYLES
// + - handles compiling & minifying of SCSS
// ------------------------------------------------

gulp.task('styles', function() {
  return gulp.src(paths.styles)
    .pipe(sass())
    .pipe(autoprefixer('last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1', 'ios 6', 'android 4'))
    .pipe(gulp.dest(build_path + '/styles'))
    .pipe(rename({ suffix: '.min' }))
    .pipe(minifyCSS())
    .pipe(gulp.dest(build_path + '/styles'))
});

// ------------------------------------------------
// + SCRIPTS
// + - handles compiling, concat & minifying JS
// ------------------------------------------------

gulp.task('scripts', function() {
  return gulp.src(paths.scripts)
    .pipe(jshint.reporter('default'))
    .pipe(concat('main.js'))
    .pipe(gulp.dest(build_path + '/scripts'))
    .pipe(rename({ suffix: '.min' }))
    .pipe(uglify())
    .pipe(gulp.dest(build_path + '/scripts'))
});

// ------------------------------------------------
// + IMAGES
// + - optimizes image files on the site
// ------------------------------------------------

gulp.task('images', function() {
  return gulp.src(paths.images)
    .pipe(cache(imagemin({ optimizationLevel: 3, progressive: true, interlaced: true })))
    .pipe(gulp.dest(build_path + '/images'))
});

// ------------------------------------------------
// + AUDIO
// + - moves audio assets to the build folder
// ------------------------------------------------

gulp.task('audio', function() {
  return gulp.src(paths.audio)
    .pipe(gulp.dest(build_path + '/media/audio'))
});

// ------------------------------------------------
// + CLEAN
// + - Cleans out the build folder
// ------------------------------------------------

gulp.task('clean', function() {
  return gulp.src(paths.clean, {read: false})
    .pipe(clean())
    .pipe(notify({
      "message": "CSS cleaned",
      "sound": "Hero",
      "open": repo
    }));
});

// ------------------------------------------------
// + ICONS
// + - builds a custom icon font from SVG files
// ------------------------------------------------

gulp.task("icons", function() {
  return fontcustom({
    "config": './fontcustom.yml',
    "noisy": true
  });
});

// ------------------------------------------------
// + SPRITES
// + - generates sprite PNG and SCSS files
// ------------------------------------------------

gulp.task('sprites', function () {
  return gulp.src(paths.sprites)
    .pipe(sprite({
      name: 'sprite.png',
      style: '_sprite.scss',
      cssPath: '../images',
      processor: 'scss',
      prefix: 'sprite',
      retina: true
    }))
    .pipe(gulpif('*.png', gulp.dest(build_path + '/images/')))
    .pipe(gulpif('*.scss', gulp.dest(build_path + '/styles/core/')));
});

// ------------------------------------------------
// + DEFAULT
// + - cleans, builds, and then watches for changes
// ------------------------------------------------

gulp.task('default', ['clean'], function() {
  gulp.start('styles', 'scripts', 'images', 'audio', 'watch');
});

// ------------------------------------------------
// + WATCH
// + - waiting for changes & LiveReload magic
// ------------------------------------------------

gulp.task('watch', function() {
  gulp.watch(source_path + '/styles/**/*.scss', ['styles']);
  gulp.watch(source_path + '/scripts/**/*.js', ['scripts']);
  gulp.watch(source_path + '/images/**/*', ['images']);
  gulp.watch(source_path + '/media/audio/**/*', ['audio']);
  var server = livereload();

  gulp.watch([build_path + '/**', template_path + '/**/*.xsl', utility_path + '/**/*.xsl']).on('change', function(file) {
    server.changed(file.path);
  });
});
