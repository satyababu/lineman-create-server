"use strict"
path = require("path")

# Send partial, or 404 if it doesn't exist

exports.partials = (req, res) ->
  stripped = req.url.split(".")[0]
  requestedView = path.join("./", stripped)
  res.render requestedView, (err, html) ->
    if err
      res.send 404
    else
      res.send html
    return

  return

# Send our single page app

exports.index = (req, res) ->
  baseurl = (if (process.env.NODE_ENV is "production") then "/generator-sample/" else "/")
  res.render "index",
    baseurl: baseurl
    title: "Generator Sample"

  return