/*! DSFR v0.6.0 | licence MIT */

(function () {
  'use strict';

  var namespace = 'dsfr';

  var api = window[namespace] || { core: {} };
  window[namespace] = api;

  var HEADER_SELECTOR = api.core.ns.selector('header');
  var HEADER_TOOLS_SELECTOR = api.core.ns.selector('header__tools');
  var HEADER_SEARCH_BAR_SELECTOR = HEADER_TOOLS_SELECTOR + " " + (api.core.ns.selector('search-bar'));
  var HEADER_SHORTCUTS_SELECTOR = HEADER_TOOLS_SELECTOR + " " + (api.core.ns.selector('shortcuts'));
  var HEADER_NAV_SELECTOR = api.core.ns.selector('nav');
  var HEADER_NAV_LIST_SELECTOR = HEADER_NAV_SELECTOR + " " + (api.core.ns.selector('nav__list'));

  var count = 0;

  var Header = function Header (header) {
    this.header = header || document.querySelector(HEADER_SELECTOR);
    this.numId = count;
    count++;
    this.modals = [];

    this.init();
  };

  Header.prototype.getModal = function getModal (element) {
    if (!element) { return; }
    var modals = api.core.Instance.getInstances(element, api.Modal);
    if (!modals || !modals.length) { return; }
    this.modals.push(modals[0]);
  };

  Header.prototype.init = function init () {
    this.tools = this.header.querySelector(HEADER_TOOLS_SELECTOR);
    this.getModal(this.tools);

    this.searchBar = this.header.querySelector(HEADER_SEARCH_BAR_SELECTOR);

    this.nav = this.header.querySelector(HEADER_NAV_SELECTOR);
    this.getModal(this.nav);

    this.shortcuts = this.header.querySelector(HEADER_SHORTCUTS_SELECTOR);

    this.navList = this.header.querySelector(HEADER_NAV_LIST_SELECTOR);

    this.changing = this.change.bind(this);

    window.addEventListener('resize', this.changing);
    this.change();
  };

  Header.prototype.change = function change () {
    this.isLarge = window.matchMedia('(min-width: 62em)').matches;

    if (this.isLarge) {
      for (var i = 0; i < this.modals.length; i++) {
        this.modals[i].conceal();
        this.modals[i].element.style.transition = 'none';
      }
    } else {
      for (var i$1 = 0; i$1 < this.modals.length; i$1++) {
        this.modals[i$1].element.style.transition = '';
      }
    }

    if (this.shortcuts !== null) {
      if (this.isLarge) {
        if (this.searchBar !== null) { this.tools.insertBefore(this.shortcuts, this.searchBar); }
        else { this.tools.appendChild(this.shortcuts); }
      } else {
        this.nav.insertBefore(this.shortcuts, this.navList);
      }
    }
  };

  api.Header = Header;

  var build = function () {
    var elements = Array.prototype.slice.call(document.querySelectorAll(HEADER_SELECTOR));

    var headers = [];

    for (var i = 0, list = elements; i < list.length; i += 1) {
      var element = list[i];

      headers.push(new Header(element));
    }
  };

  /* eslint-disable no-new */

  new api.core.Initializer(HEADER_SELECTOR, [build]);

}());
//# sourceMappingURL=header.nomodule.js.map
