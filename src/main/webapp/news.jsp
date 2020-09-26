<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page import="in.dao.LogAndAuditDAO"  %>
<%@ page import="in.dao.LogAndAuditDAOImpl" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
<link rel="stylesheet" type="text/css" href="https://brokensquare.com/Code/jquery-flipster/dist/jquery.flipster.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://brokensquare.com/Code/jquery-flipster/dist/jquery.flipster.min.js"></script>
<script src="https://codepen.io/shshaw/pen/epmrgO"></script>
<meta name="viewport" content="width=device-width">
  <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flickity@2/dist/flickity.css">
  <script src="https://npmcdn.com/flickity@2/dist/flickity.pkgd.js"></script>
<style type="text/css">
  .flipster--loop {
  /*  .flipster__item--past { transform: translateX(-100%); }
  .flipster__item--future { transform: translateX(100%); }*/
}
.flipster--loop .flipster__item {
  position: absolute;
}
.flipster--loop .flipster__item--past-2 {
  -webkit-transform: translateX(-100%);
          transform: translateX(-100%);
}
.flipster--loop .flipster__item--future-2 {
  -webkit-transform: translateX(100%);
          transform: translateX(100%);
}
.flipster--loop .flipster__item--past-1 {
  -webkit-transform: translateX(-50%);
          transform: translateX(-50%);
}
.flipster--loop .flipster__item--future-1 {
  -webkit-transform: translateX(50%);
          transform: translateX(50%);
}
.flipster--infinite-carousel .flipster__container,
.flipster--infinite-carousel .flipster__item {
  -webkit-transition: all 350ms ease-in-out;
  transition: all 350ms ease-in-out;
  -webkit-transition-timing-function: cubic-bezier(0.56, 0.12, 0.12, 0.98);
          transition-timing-function: cubic-bezier(0.56, 0.12, 0.12, 0.98);
}
.flipster--infinite-carousel .flipster__item__content {
  -webkit-transition: inherit;
  transition: inherit;
}
.flipster--infinite-carousel .flipster__item {
  position: absolute;
  opacity: 0;
  -webkit-perspective: 800px;
          perspective: 800px;
}
.flipster--infinite-carousel .flipster__item--past-2,
.flipster--infinite-carousel .flipster__item--future-2 {
  opacity: 0.6;
  -webkit-transition-delay: 90ms;
          transition-delay: 90ms;
}
.flipster--infinite-carousel .flipster__item--past-1,
.flipster--infinite-carousel .flipster__item--future-1 {
  opacity: 0.8;
  -webkit-transition-delay: 60ms;
          transition-delay: 60ms;
}
.flipster--infinite-carousel .flipster__item--current {
  opacity: 1;
  -webkit-transition-delay: 0;
          transition-delay: 0;
}
.flipster--infinite-carousel .flipster__item--past .flipster__item__content,
.flipster--infinite-carousel .flipster__item--future .flipster__item__content {
  -webkit-transform: scale(0.4);
          transform: scale(0.4);
}
.flipster--infinite-carousel .flipster__item--past-2 .flipster__item__content {
  -webkit-transform: translateX(-75%) rotateY(45deg) scale(0.6);
          transform: translateX(-75%) rotateY(45deg) scale(0.6);
}
.flipster--infinite-carousel .flipster__item--future-2 .flipster__item__content {
  -webkit-transform: translateX(75%) rotateY(-45deg) scale(0.6);
          transform: translateX(75%) rotateY(-45deg) scale(0.6);
}
.flipster--infinite-carousel .flipster__item--past-1 .flipster__item__content {
  -webkit-transform: translateX(-50%) rotateY(45deg) scale(0.8);
          transform: translateX(-50%) rotateY(45deg) scale(0.8);
}
.flipster--infinite-carousel .flipster__item--future-1 .flipster__item__content {
  -webkit-transform: translateX(50%) rotateY(-45deg) scale(0.8);
          transform: translateX(50%) rotateY(-45deg) scale(0.8);
}
.flipster--infinite-carousel .flipster__item--current .flipster__item__content {
  -webkit-transform: translateX(0) rotateY(0deg) scale(1);
          transform: translateX(0) rotateY(0deg) scale(1);
}
div.container img {
  width: 100%;
  height: 140px;
}
div.container {
  margin: 5px;
  border: 1px solid #ccc;
  float: left;
  height:200px;
  width: 200px;
}

div.container:hover {
  border: 1px solid #777;
}



* { box-sizing: border-box; }

body { font-family: sans-serif; }

.carousel {
  background: #EEE;
}

.carousel-cell {
  width: 17%;
  height: 200px;
  margin-right: 10px;
  /*background: #8C8;*/
  border-radius: 5px;
  /*counter-increment: carousel-cell;*/
}

.carousel-cell.is-selected {
  background: #ED2;
}

/* cell number */
.carousel-cell:before {
  display: block;
  text-align: center;
  content: counter(carousel-cell);
  line-height: 200px;
  font-size: 80px;
  color: white;
}
div.desc {
  padding: 15px;
  text-align: center;
}
.navbarr {
  overflow: hidden;
  background-color: #333;
  height: 70px;
  top: 0;
  border:0;
}

.navbarr a {
  float: left;
  font-size: 20px;
  color: white;
  text-align: center;
  padding: 20px 16px;
  text-decoration: none;
}

.dropdownn {
  float: left;
  overflow: hidden;
}

.dropdownn .dropbtn {
  font-size: 20px;  
  border: none;
  outline: none;
  color: white;
  padding: 20px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbarr a:hover, .dropdownn:hover .dropbtn {
  background-color: grey;
}

.dropdown-contentt {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-contentt a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-contentt a:hover {
  background-color: #ddd;
}

.dropdownn:hover .dropdown-contentt {
  display: block;
}
</style>	
</head>
<body>
	<div class="navbarr">
  <a href="HomePage.jsp">Home</a>
  <a href="news.jsp">News</a>
  <div class="dropdownn">
    <button class="dropbtn">Add Data 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-contentt">
      <a href="UploadAlbumController">Add Album</a>
    <a href="AddAlbumTypeController?action=ADD">Add Album Type</a>
    <a href="UploadPerformerController?action=ADD">Add Performer</a>
    <a href="UploadTrackController">Add Track</a>
    </div>
  </div> 
   <div class="dropdownn">
    <button class="dropbtn">Reports
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-contentt">
      <a href="AlbumViewerController?action=DISPLAY">Album Reports</a>
    <a href="AddAlbumTypeController?action=VIEW">Album Type Reports</a>
    <a href="UploadPerformerController?action=VIEW">Performer Reports</a>
    <a href="TrackViewerController?action=DISPLAY">Track Reports</a>
    <a href="UserController?action=LIST">User Reports</a>
    </div>
  </div> 
</div>
<br>
  <img src="source/music_subscription_homepage_banner.jpg" height="300px" width="1400px">
  <center><h1>Coming Soon</h1></center>
      <div class="flipster">
        <ul class="flip-items">
            <li id="1">
                <img src="https://www.cheatsheet.com/wp-content/uploads/2020/01/BillieEilishtosingJamesBond-1024x682.jpg" height="300px" width="300px">
            </li>
            <li id="2">
                <img src="https://cdn2.albumoftheyear.org/690x/album/195881-future-nostalgia-1.jpg" height="300px" width="300px">
             </li>
            <li id="3">
                <img src="https://cdn2.albumoftheyear.org/690x/album/2020/185770-have-we-met-1.jpg" height="300px" width="300px">
            </li>
            <li id="4">
                <img src="https://cdn2.albumoftheyear.org/400x/album/186745-the-slow-rush.jpg" height="300px" width="300px">
            </li>
            <li id="5">
                <img src="https://cdn2.albumoftheyear.org/690x/album/188319-west-of-eden.jpg" height="300px" width="300px">
            </li>
           
            <li id="6">
                <img src="https://cdn2.albumoftheyear.org/690x/album/238991-a-heros-death.jpg" height="300px" width="300px">
            </li>
            <li id="7">
                <img src="https://cdn2.albumoftheyear.org/690x/album/241435-wunna-2.jpg" height="300px" width="300px">
            </li>
        </ul>
    </div>

    <br><br>
    <h1>Bands to shake up the 2020s</h1>

<!-- Flickity HTML init -->
<div class="carousel" data-flickity='{ "groupCells": true }'>
  <div class="container"><a target="_blank" href="https://en.wikipedia.org/wiki/Dirty_Honey"><img src="https://cdn.mos.cms.futurecdn.net/yjg3D3uVpaGaQsRz5gbiMj-970-80.jpg"></a><div class="desc">Dirty Honey</div></div>

  <div class="container"><a target="_blank" href="https://en.wikipedia.org/wiki/Times_Two"><img src="https://cdn.mos.cms.futurecdn.net/k95rYayhKNPCP6RATuAZ7G-970-80.jpg"></a><div class="desc">John (TimesTwo)</div></div>

  <div class="container"><a target="_blank" href="https://en.wikipedia.org/wiki/Yola_(singer)"><img src="https://cdn.mos.cms.futurecdn.net/5FJCXyfvboKjCsvcWED9Vf-970-80.jpg"></a><div class="desc">Yola</div></div>

  <div class="container"><a target="_blank" href="https://en.wikipedia.org/wiki/The_Glorious_Sons"><img src="https://cdn.mos.cms.futurecdn.net/bcoxEwWgBTisf3h3X6SLY9-970-80.jpg"></a><div class="desc">The Glorious Sons</div></div>

  <div class="container"><a target="_blank" href="https://en.wikipedia.org/wiki/Larkin_Poe"><img src="https://cdn.mos.cms.futurecdn.net/vJhDnmTfFrpT2uYoc9FTFb-970-80.jpg"></a><div class="desc">Larkin Poe</div></div>

  <div class="container"><a target="_blank" href="https://en.wikipedia.org/wiki/Nick_Perri"><img src="https://cdn.mos.cms.futurecdn.net/HSNGJUgJgJ2faqhxtwhYrP-970-80.jpg"></a><div class="desc">The Underground Thieves</div></div>

  <div class="container"><a target="_blank" href="https://en.wikipedia.org/wiki/Sleep_Token"><img src="https://cdn.mos.cms.futurecdn.net/G4CrHAgjP9M9EMUR47ReFE-970-80.jpg"></a><div class="desc">Sleep Token</div></div>

  <div class="container"><a target="_blank" href="https://en.wikipedia.org/wiki/BTS"><img src="https://upload.wikimedia.org/wikipedia/commons/0/0d/%E2%80%98LG_Q7_BTS_%EC%97%90%EB%94%94%EC%85%98%E2%80%99_%EC%98%88%EC%95%BD_%ED%8C%90%EB%A7%A4_%EC%8B%9C%EC%9E%91_%2842773472410%29_%28cropped%29.jpg"></a><div class="desc">B T S</div></div>

  <div class="container"><a target="_blank" href="https://en.wikipedia.org/wiki/Jonas_Brothers"><img src="https://api.time.com/wp-content/uploads/2019/06/jonas-brothers-band.jpg"></a><div class="desc">Jonas Brothers</div></div>
  
  <div class="container"><a target="_blank" href="https://en.wikipedia.org/wiki/Nirvana_(band)"><img src="https://cdn.britannica.com/s:500x350/27/23027-004-633EF982/Nirvana-Kurt-Cobain-Krist-Novoselic-Dave-Grohl.jpg"></a><div class="desc">Nirvana</div></div>

  <div class="container"><a target="_blank" href="https://en.wikipedia.org/wiki/The_Troggs"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRUFwPjByUzq11QCLxAaILF2UxDx9TsZiLnOA&usqp=CAU"></a><div class="desc">Troggs on Air</div></div>

</div>
<script type="text/javascript">
  /* jshint browser: true, jquery: true, devel: true */
/* global window, jQuery */

(function($, window, undefined) {
    'use strict';

    function throttle(func, delay) {
        var timer = null;

        return function() {
            var context = this,
                args = arguments;

            if ( timer === null ) {
                timer = setTimeout(function() {
                    func.apply(context, args);
                    timer = null;
                }, delay);
            }
        };
    }

    // Check for browser CSS support and cache the result for subsequent calls.
    var checkStyleSupport = (function() {
        var support = {};
        return function(prop) {
            if ( support[prop] !== undefined ) { return support[prop]; }

            var div = document.createElement('div'),
                style = div.style,
                ucProp = prop.charAt(0).toUpperCase() + prop.slice(1),
                prefixes = ["webkit", "moz", "ms", "o"],
                props = (prop + ' ' + (prefixes).join(ucProp + ' ') + ucProp).split(' ');

            for (var i in props) {
                if ( props[i] in style ) { return support[prop] = props[i]; }
            }

            return support[prop] = false;
        };
    }());

    var svgNS = 'http://www.w3.org/2000/svg',
        svgSupport = (function() {
            var support;
            return function() {
                if ( support !== undefined ) { return support; }
                var div = document.createElement('div');
                div.innerHTML = '<svg/>';
                support = ( div.firstChild && div.firstChild.namespaceURI === svgNS );
                return support;
            };
        }());

    var $window = $(window),

        transformSupport = checkStyleSupport('transform'),

        defaults = {
            itemContainer: 'ul',
            // [string|object]
            // Selector for the container of the flippin' items.

            itemSelector: 'li',
            // [string|object]
            // Selector for children of `itemContainer` to flip

            start: 'center',
            // ['center'|number]
            // Zero based index of the starting item, or use 'center' to start in the middle

            fadeIn: 400,
            // [milliseconds]
            // Speed of the fade in animation after items have been setup

            loop: false,
            // [true|false|number]
            // Loop around when the start or end is reached
            // If number, this is the number of items that will be shown when the beginning or end is reached

            autoplay: false,
            // [false|milliseconds]
            // If a positive number, Flipster will automatically advance to next item after that number of milliseconds

            pauseOnHover: true,
            // [true|false]
            // If true, autoplay advancement will pause when Flipster is hovered

            style: 'coverflow',
            // [coverflow|carousel|flat|...]
            // Adds a class (e.g. flipster--coverflow) to the flipster element to switch between display styles
            // Create your own theme in CSS and use this setting to have Flipster add the custom class

            spacing: -0.6,
            // [number]
            // Space between items relative to each item's width. 0 for no spacing, negative values to overlap

            click: true,
            // [true|false]
            // Clicking an item switches to that item

            keyboard: true,
            // [true|false]
            // Enable left/right arrow navigation

            scrollwheel: true,
            // [true|false]
            // Enable mousewheel/trackpad navigation; up/left = previous, down/right = next

            touch: true,
            // [true|false]
            // Enable swipe navigation for touch devices

            nav: false,
            // [true|false|'before'|'after']
            // If not false, Flipster will build an unordered list of the items
            // Values true or 'before' will insert the navigation before the items, 'after' will append the navigation after the items

            buttons: false,
            // [true|false|'custom']
            // If true, Flipster will insert Previous / Next buttons with SVG arrows
            // If 'custom', Flipster will not insert the arrows and will instead use the values of `buttonPrev` and `buttonNext`

            buttonPrev: 'Previous',
            // [text|html]
            // Changes the text for the Previous button

            buttonNext: 'Next',
            // [text|html]
            // Changes the text for the Next button

            onItemSwitch: false
            // [function]
            // Callback function when items are switched
            // Arguments received: [currentItem, previousItem]
        },

        classes = {
            main: 'flipster',
            active: 'flipster--active',
            container: 'flipster__container',

            nav: 'flipster__nav',
            navChild: 'flipster__nav__child',
            navItem: 'flipster__nav__item',
            navLink: 'flipster__nav__link',
            navCurrent: 'flipster__nav__item--current',
            navCategory: 'flipster__nav__item--category',
            navCategoryLink: 'flipster__nav__link--category',

            button: 'flipster__button',
            buttonPrev: 'flipster__button--prev',
            buttonNext: 'flipster__button--next',

            item: 'flipster__item',
            itemCurrent: 'flipster__item--current',
            itemPast: 'flipster__item--past',
            itemFuture: 'flipster__item--future',
            itemContent: 'flipster__item__content'
        },

        classRemover = new RegExp('\\b(' + classes.itemCurrent + '|' + classes.itemPast + '|' + classes.itemFuture + ')(.*?)(\\s|$)', 'g'),
        whiteSpaceRemover = new RegExp('\\s\\s+', 'g');

    $.fn.flipster = function(options) {
        var isMethodCall = (typeof options === 'string' ? true : false);

        if ( isMethodCall ) {
            var args = Array.prototype.slice.call(arguments, 1);
            return this.each(function() {
                var methods = $(this).data('methods');
                if ( methods[options] ) {
                    return methods[options].apply(this, args);
                } else {
                    return this;
                }
            });
        }

        var settings = $.extend({}, defaults, options);

        return this.each(function() {

            var self = $(this),
                methods,

                _container,
                _containerWidth,

                _items,
                _itemOffsets = [],
                _currentItem,
                _currentIndex = 0,

                _nav,
                _navItems,
                _navLinks,

                _playing = false,
                _startDrag = false;

            function buildButtonContent(dir) {
                var text = ( dir === 'next' ? settings.buttonNext : settings.buttonPrev );

                if ( settings.buttons === 'custom' || !svgSupport ) { return text; }

                return '<svg viewBox="0 0 13 20" xmlns="' + svgNS + '" aria-labelledby="title"><title>' + text + '</title><polyline points="10,3 3,10 10,17"' + (dir === 'next' ? ' transform="rotate(180 6.5,10)"' : '') + '/></svg>';
            }

            function buildButton(dir) {
                dir = dir || 'next';

                return $('<button class="' + classes.button + ' ' + ( dir === 'next' ? classes.buttonNext : classes.buttonPrev ) + '" role="button" />')
                    .html(buildButtonContent(dir))
                    .on('click', function(e) {
                        jump(dir);
                        e.preventDefault();
                    });

            }

            function buildButtons() {
                if ( settings.buttons && _items.length > 1 ) {
                    self.find('.' + classes.button).remove();
                    self.append(buildButton('prev'), buildButton('next'));
                }
            }

            function buildNav() {
                var navCategories = {};

                if ( !settings.nav || _items.length <= 1 ) { return; }

                if ( _nav ) { _nav.remove(); }

                _nav = $('<ul class="' + classes.nav + '" role="navigation" />');
                _navLinks = $('');

                _items.each(function(i) {
                    var item = $(this),
                        category = item.data('flip-category'),
                        itemTitle = item.data('flip-title') || item.attr('title') || i,
                        navLink = $('<a href="#" class="' + classes.navLink + '">' + itemTitle + '</a>')
                        .data('index', i);

                    _navLinks = _navLinks.add(navLink);

                    if ( category ) {

                        if ( !navCategories[category] ) {

                            var categoryItem = $('<li class="' + classes.navItem + ' ' + classes.navCategory + '">');
                            var categoryLink = $('<a href="#" class="' + classes.navLink + ' ' + classes.navCategoryLink + '" data-flip-category="' + category + '">' + category + '</a>')
                                    .data('category', category)
                                    .data('index', i);

                            navCategories[category] = $('<ul class="' + classes.navChild + '" />');

                            _navLinks = _navLinks.add(categoryLink);

                            categoryItem
                                .append(categoryLink, navCategories[category])
                                .appendTo(_nav);
                        }

                        navCategories[category].append(navLink);
                    } else {
                        _nav.append(navLink);
                    }

                    navLink.wrap('<li class="' + classes.navItem + '">');

                });

                _nav.on('click', 'a', function(e) {
                    var index = $(this).data('index');
                    if ( index >= 0 ) {
                        jump(index);
                        e.preventDefault();
                    }
                });

                if ( settings.nav === 'after' ) { self.append(_nav); }
                else { self.prepend(_nav); }

                _navItems = _nav.find('.' + classes.navItem);
            }

            function updateNav() {
                if ( settings.nav ) {

                    var category = _currentItem.data('flip-category');

                    _navItems.removeClass(classes.navCurrent);

                    _navLinks
                        .filter(function() {
                            return ($(this).data('index') === _currentIndex || (category && $(this).data('category') === category));
                        })
                        .parent()
                        .addClass(classes.navCurrent);

                }
            }

            function noTransition() {
                self.css('transition', 'none');
                _container.css('transition', 'none');
                _items.css('transition', 'none');
            }

            function resetTransition() {
                self.css('transition', '');
                _container.css('transition', '');
                _items.css('transition', '');
            }

            function calculateBiggestItemHeight() {
                var biggestHeight = 0,
                    itemHeight;

                _items.each(function() {
                    itemHeight = $(this).height();
                    if ( itemHeight > biggestHeight ) { biggestHeight = itemHeight; }
                });
                return biggestHeight;
            }

            function resize(skipTransition) {
                if ( skipTransition ) { noTransition(); }

                _containerWidth = _container.width();
                _container.height(calculateBiggestItemHeight());

                _items.each(function(i) {
                    var item = $(this),
                        width,
                        left;

                    item.attr('class', function(i, c) {
                        return c && c.replace(classRemover, '').replace(whiteSpaceRemover, ' ');
                    });

                    width = item.outerWidth();

                    if ( settings.spacing !== 0 ) {
                        item.css('margin-right', ( width * settings.spacing ) + 'px');
                    }

                    left = item.position().left;
                    _itemOffsets[i] = -1 * ((left + (width / 2)) - (_containerWidth / 2));

                    if ( i === _items.length - 1 ) {
                        center();
                        if ( skipTransition ) { setTimeout(resetTransition, 1); }
                    }
                });
            }

            function center() {
                var total = _items.length,
                    loopCount = ( settings.loop !== true && settings.loop > 0 ? settings.loop : false ),
                    item, newClass, zIndex, past, offset;

                if ( _currentIndex >= 0 ) {

                    _items.each(function(i) {
                        item = $(this);
                        newClass = ' ';

                        if ( i === _currentIndex ) {
                            newClass += classes.itemCurrent;
                            zIndex = (total + 2);
                        } else {
                            past = ( i < _currentIndex ? true : false );
                            offset = ( past ? _currentIndex - i : i - _currentIndex );

                            if ( loopCount ) {
                                if ( _currentIndex <= loopCount && i > _currentIndex + loopCount ) {
                                    past = true;
                                    offset = (total + _currentIndex) - i;
                                } else if ( _currentIndex >= total - loopCount && i < _currentIndex - loopCount ) {
                                    past = false;
                                    offset = (total - _currentIndex) + i;
                                }
                            }

                            newClass += (past ?
                                classes.itemPast + ' ' + classes.itemPast + '-' + offset :
                                classes.itemFuture + ' ' + classes.itemFuture + '-' + offset
                            );

                            zIndex = total - offset;
                        }

                        item
                            .css('z-index', zIndex * 2)
                            .attr('class', function(i, c) {
                                return c && c.replace(classRemover, '').replace(whiteSpaceRemover, ' ') + newClass;
                            });
                    });

                    if ( !_containerWidth || _itemOffsets[_currentIndex] === undefined ) { resize(true); }

                    if ( transformSupport ) {
                        _container.css('transform', 'translateX(' + _itemOffsets[_currentIndex] + 'px)');
                    } else {
                        _container.css('left', _itemOffsets[_currentIndex] + 'px' );
                    }
                }

                updateNav();
            }

            function jump(to) {
                var _previous = _currentIndex;

                if ( _items.length <= 1 ) { return; }

                if ( to === 'prev' ) {
                    if ( _currentIndex > 0 ) { _currentIndex--; }
                    else if ( settings.loop ) { _currentIndex = _items.length - 1; }
                } else if ( to === 'next' ) {
                    if ( _currentIndex < _items.length - 1 ) { _currentIndex++; }
                    else if ( settings.loop ) { _currentIndex = 0; }
                } else if ( typeof to === 'number' ) { _currentIndex = to;
                } else if ( to !== undefined ) {
                    // if object is sent, get its index
                    _currentIndex = _items.index(to);
                }

                _currentItem = _items.eq(_currentIndex);

                if ( _currentIndex !== _previous && settings.onItemSwitch ) {
                    settings.onItemSwitch.call(self, _items[_currentIndex], _items[_previous]);
                }

                center();

                return self;
            }

            function play(interval) {
                settings.autoplay = interval || settings.autoplay;

                clearInterval(_playing);

                _playing = setInterval(function() {
                    var prev = _currentIndex;
                    jump('next');
                    if ( prev === _currentIndex && !settings.loop ) { clearInterval(_playing); }
                }, settings.autoplay);

                return self;
            }

            function pause() {
                clearInterval(_playing);
                if ( settings.autoplay ) { _playing = -1; }

                return self;
            }

            function show() {
                resize(true);
                self.hide()
                    .css('visibility', '')
                    .addClass(classes.active)
                    .fadeIn(settings.fadeIn);
            }

            function index() {

                _container = self.find(settings.itemContainer).addClass(classes.container);

                _items = _container.find(settings.itemSelector);

                if ( _items.length <= 1 ) { return; }

                _items
                    .addClass(classes.item)
                    // Wrap inner content
                    .each(function() {
                        var item = $(this);
                        if ( !item.children('.' + classes.itemContent ).length) {
                            item.wrapInner('<div class="' + classes.itemContent + '" />');
                        }
                    });

                // Navigate directly to an item by clicking
                if ( settings.click ) {
                    _items.on('click.flipster touchend.flipster', function(e) {
                        if ( !_startDrag ) {
                            if ( !$(this).hasClass(classes.itemCurrent) ) { e.preventDefault(); }
                            jump(this);
                        }
                    });
                }

                // Insert navigation if enabled.
                buildButtons();
                buildNav();

                if ( _currentIndex >= 0 ) { jump(_currentIndex); }

                return self;
            }

            function keyboardEvents(elem) {
                if ( settings.keyboard ) {
                    elem[0].tabIndex = 0;
                    elem.on('keydown.flipster', throttle(function(e) {
                        var code = e.which;
                        if ( code === 37 || code === 39 ) {
                            jump( code === 37 ? 'prev' : 'next' );
                            e.preventDefault();
                        }
                    }, 250, true));
                }
            }

            function wheelEvents(elem) {
                if ( settings.scrollwheel ) {
                    var _wheelInside = false,
                        _actionThrottle = 0,
                        _throttleTimeout = 0,
                        _delta = 0,
                        _dir, _lastDir;

                    elem
                        .on('mousewheel.flipster wheel.flipster', function() { _wheelInside = true; })
                        .on('mousewheel.flipster wheel.flipster', throttle(function(e) {

                            // Reset after a period without scrolling.
                            clearTimeout(_throttleTimeout);
                            _throttleTimeout = setTimeout(function() {
                                _actionThrottle = 0;
                                _delta = 0;
                            }, 300);

                            e = e.originalEvent;

                            // Add to delta (+=) so that continuous small events can still get past the speed limit, and quick direction reversals get cancelled out
                            _delta += (e.wheelDelta || (e.deltaY + e.deltaX) * -1); // Invert numbers for Firefox

                            // Don't trigger unless the scroll is decent speed.
                            if ( Math.abs(_delta) < 25 ) { return; }

                            _actionThrottle++;

                            _dir = (_delta > 0 ? 'prev' : 'next');

                            // Reset throttle if direction changed.
                            if ( _lastDir !== _dir ) { _actionThrottle = 0; }
                            _lastDir = _dir;

                            // Regular scroll wheels trigger less events, so they don't need to be throttled. Trackpads trigger many events (inertia), so only trigger jump every three times to slow things down.
                            if ( _actionThrottle < 6 || _actionThrottle % 3 === 0 ) { jump(_dir); }

                            _delta = 0;

                        }, 50));

                    // Disable mousewheel on window if event began in elem.
                    $window.on('mousewheel.flipster wheel.flipster', function(e) {
                        if ( _wheelInside ) {
                            e.preventDefault();
                            _wheelInside = false;
                        }
                    });
                }
            }

            function touchEvents(elem) {
                if ( settings.touch ) {
                    var _startDragY = false,
                        _touchJump = throttle(jump, 300),
                        x, y, offsetY, offsetX;

                    elem.on({
                        'touchstart.flipster': function(e) {
                            e = e.originalEvent;
                            _startDrag = (e.touches ? e.touches[0].clientX : e.clientX);
                            _startDragY = (e.touches ? e.touches[0].clientY : e.clientY);
                            //e.preventDefault();
                        },

                        'touchmove.flipster': throttle(function(e) {
                            if ( _startDrag !== false ) {
                                e = e.originalEvent;

                                x = (e.touches ? e.touches[0].clientX : e.clientX);
                                y = (e.touches ? e.touches[0].clientY : e.clientY);
                                offsetY = y - _startDragY;
                                offsetX = x - _startDrag;

                                if ( Math.abs(offsetY) < 100 && Math.abs(offsetX) >= 30 ) {
                                    _touchJump((offsetX < 0 ? 'next' : 'prev'));
                                    _startDrag = x;
                                    e.preventDefault();
                                }

                            }
                        }, 100),

                        'touchend.flipster touchcancel.flipster ': function() { _startDrag = false; }
                    });
                }
            }

            function init() {

                var style;

                self.css('visibility', 'hidden');

                index();

                if ( _items.length <= 1 ) {
                    self.css('visibility', '');
                    return;
                }

                style = (settings.style ? 'flipster--' + settings.style.split(' ').join(' flipster--') : false);

                self.addClass([
                    classes.main,
                    (transformSupport ? 'flipster--transform' : ' flipster--no-transform'),
                    style, // 'flipster--'+settings.style : '' ),
                    (settings.click ? 'flipster--click' : '')
                ].join(' '));

                // Set the starting item
                if ( settings.start ) {
                    // Find the middle item if start = center
                    _currentIndex = ( settings.start === 'center' ? Math.floor(_items.length / 2) : settings.start );
                }

                jump(_currentIndex);

                var images = self.find('img');

                if ( images.length ) {
                    var imagesLoaded = 0;

                    // Resize after all images have loaded.
                    images.on('load', function() {
                        imagesLoaded++;
                        if ( imagesLoaded >= images.length ) { show(); }
                    });

                    // Fallback to show Flipster while images load in case it takes a while.
                    setTimeout(show, 750);
                } else {
                    show();
                }

                // Attach event bindings.
                $window.on('resize.flipster', throttle(resize, 400));

                if ( settings.autoplay ) { play(); }

                if ( settings.pauseOnHover ) {
                    _container
                        .on('mouseenter.flipster', pause)
                        .on('mouseleave.flipster', function() {
                            if ( _playing === -1 ) { play(); }
                        });
                }

                keyboardEvents(self);
                wheelEvents(_container);
                touchEvents(_container);
            }

            // public methods
            methods = {
                jump: jump,
                next: function() { return jump('next'); },
                prev: function() { return jump('prev'); },
                play: play,
                pause: pause,
                index: index
            };
            self.data('methods', methods);

            // Initialize if flipster is not already active.
            if ( !self.hasClass(classes.active) ) { init(); }
        });
    };
})(jQuery, window);



var flipContainer = $('.flipster'),
    flipItemContainer = flipContainer.find('.flip-items'),
    flipItem = flipContainer.find('li');

flipContainer.flipster({
  itemContainer: flipItemContainer,
  itemSelector: flipItem,
  loop: 2,
  start: 2,
  style: 'infinite-carousel',
  spacing: 0,
  scrollwheel: false,
  //nav: 'after',
  buttons: false
});


</script>
<%
	String email = (String) session.getAttribute("email");
	LogAndAuditDAO logAndAuditDAO = null;
	logAndAuditDAO = new LogAndAuditDAOImpl();
	if(logAndAuditDAO.save("News Page Access", "Admin", email)) {
		System.out.println("News Page event inserted");
	}
%>
</body>
</html>