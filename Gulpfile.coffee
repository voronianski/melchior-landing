gulp = require 'gulp'
connect = require 'gulp-connect'
myth = require 'gulp-myth'

port = process.env.PORT or 9092

gulp.task 'styles', ->
	gulp.src('./myth/main.css')
		.pipe(myth())
		.pipe(gulp.dest './css')

gulp.task 'connect', ->
	connect.server root: './', port: port

gulp.task 'watch', ->
	gulp.watch './myth/**/*.css', ['styles']

gulp.task 'server', ['connect']
gulp.task 'build', ['styles']
gulp.task 'default', ['build', 'server', 'watch']
