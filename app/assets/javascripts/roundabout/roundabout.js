function drawArrows() {
  window.paper = Raphael(0, 0, document.getElementById('roundabout').getAttribute('data-svg-width'), document.getElementById('roundabout').getAttribute('data-svg-height'));

  eval(window.raw_edges).forEach(function(e) {
    var path = "M" + e[0].replace("e,", "") + "L" + e[1].replace("e,", "")
    window.paper.path(path).attr({'stroke-width': 2, stroke: e[2], 'arrow-end': 'classic-wide-long'})
  })
}
