after = (ms, fn) -> setTimeout(fn, ms)

jQuery ($) ->
  # Detect 3D support

  prefix = 'moz'    if $.browser.mozilla
  prefix = 'webkit' if $.browser.webkit
  prefix = 'o'      if $.browser.opera
  prefix = 'ms'     if $.browser.msie

  detect3d = ->
    return true  if document.body.style.MozPerspective?
    return false unless window.matchMedia?

    result = matchMedia("all and (transform-3d)")
    return true if result.matches
    matchMedia("all and (-#{prefix}-transform-3d)").matches

  support3d = detect3d()
  $('body').addClass(if support3d then 'transform3d' else 'transform2d')

  # Open source corner animation

  if support3d
    corner    = $('.open-source')
    shadow    = corner.find('.shadow')
    translate = corner.find('.translate')
    rotator   = corner.find('.rotator')

    duration   = rotator.css('transition-duration')
    duration ||= rotator.css("-#{prefix}-transition-duration")
    duration   = parseFloat(duration) * 1000

    shadowing = ->
      if shadow.is(':animated')
        shadow.stop(true).animate(opacity: 0, (duration / 2), 'linear')
      else
        shadow.animate(opacity: 1, (duration / 2), 'linear').
               animate(opacity: 0, (duration / 2), 'linear')

    corner.mouseenter ->
      shadowing()
      after duration, ->
        translate.addClass('show') if corner.is(':hover')
    corner.mouseleave ->
      shadowing()
      translate.removeClass('show')

    # FF backface-visibility fix

    if $.browser.mozilla
      back = corner.find('.text, .border')
      corner.mouseenter ->
        back.stop(true).delay(duration / 2).hide(1)
      corner.mouseleave ->
        back.stop(true).delay(duration / 2).show(1)
