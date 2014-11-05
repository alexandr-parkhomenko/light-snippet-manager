module.exports = (grunt) ->
  # Load all grunt-* related tasks
  require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks

  grunt.initConfig

    path: 'build',

    clean:
      dist: '<%= path %>/*'

    copy:
      bower:
        expand: true
        src: ['bower_components/**/*']
        dest: '<%= path %>'
      static:
        files:
          '<%= path %>/manifest.json': ['manifest.json']
          '<%= path %>/index.html': ['index.html']

    coffee:
      dist:
        expand: true,
        cwd: 'src/',
        src: '**/*.coffee',
        dest: '<%= path %>',
        ext: '.js'

    stylus:
      dist:
        expand: true,
        cwd: './',
        src: '*.styl',
        dest: '<%= path %>',
        ext: '.css'

    watch:
      scripts:
        files: ['**/*.coffee', '*.styl', '*.html' ]
        tasks: ['clean', 'stylus', 'coffee', 'copy']

  grunt.registerTask 'default', ['build', 'watch']
  grunt.registerTask 'build', ['clean', 'stylus', 'coffee', 'copy']
