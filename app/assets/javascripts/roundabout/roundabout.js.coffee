$ ->
  window.paper = Raphael(0, 0, $('#roundabout').data('svg-width'), $('#roundabout').data('svg-height'))
  $.each eval(window.raw_edges), (i, e) ->
    path = "M#{e[0].replace("e,", "")}L#{e[1].replace("e,", "")}"
    window.paper.path(path).attr({'stroke-width': 2, stroke: e[2], 'arrow-end': 'classic-wide-long'})
