module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks

  grunt.initConfig
    coffee:
      compile:
        files: [
          expand: true,
          cwd: 'source/coffee/'
          src: '**/*.coffee'
          dest: 'public/js/'
          ext: '.js'
        ]
    jade:
      compile:
        files: [
          expand: true,
          cwd: 'views/'
          src: '**/*.jade'
          dest: 'public/'
          ext: '.html'
        ]
    copy:
      main:
        files: [
          expand: true
          cwd: "source/js/"
          src: "**"
          dest: "public/js/"
        ,
          expand: true
          cwd: "source/css/"
          src: "**"
          dest: "public/css/"
        ,
          expand: true
          cwd: "source/img/"
          src: "**"
          dest: "public/img/"
        ]
    watch:
      coffee:
        files: ['source/coffee/**/*.coffee']
        tasks: ['coffee:compile']
      copy:
        files: ['source/js/**', 'source/css/**', 'source/img/**']
        tasks: ['copy']
      jade:
        files: ['views/**/*.jade']
        tasks: ['jade:compile']

    karma:
      spec:
        basePath: '../'
        configFile: 'config/karma.conf.coffee'
        autoWatch: true
      travis:
        basePath: '../'
        configFile: 'config/karma.conf.coffee'
        autoWatch: false
        singleRun: true

    clean: ["public/"]

  grunt.renameTask 'regarde', 'watch'

  grunt.registerTask('test', ['karma:spec'])

  grunt.registerTask 'spawnServer', ->
    fs = require('fs')
    out = fs.openSync('./logs/dashboard.log', 'a')
    err = fs.openSync('./logs/dashboard.log', 'a')

    grunt.util.spawn
      cmd: 'node'
      args: ['node_modules/node-dev/node-dev', 'dashboard.coffee']
      opts: stdio: ['ignore', out, err]

    # watch keeps the grunt process open so the server keeps open as well
    grunt.task.run('watch')

  grunt.registerTask 'server', [
    'default'
    'spawnServer'
  ]

  grunt.registerTask 'default', [
    'clean'
    'jade:compile'
    'coffee:compile'
    'copy:main'
  ]
