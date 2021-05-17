/*! DSFR v0.6.0 | licence MIT */

const namespace = 'dsfr';

const api = window[namespace] || { core: {} };
window[namespace] = api;

const HEADER_SELECTOR = api.core.ns.selector('header');
const HEADER_TOOLS_SELECTOR = api.core.ns.selector('header__tools');
const HEADER_SEARCH_BAR_SELECTOR = `${HEADER_TOOLS_SELECTOR} ${api.core.ns.selector('search-bar')}`;
const HEADER_SHORTCUTS_SELECTOR = `${HEADER_TOOLS_SELECTOR} ${api.core.ns.selector('shortcuts')}`;
const HEADER_NAV_SELECTOR = api.core.ns.selector('nav');
const HEADER_NAV_LIST_SELECTOR = `${HEADER_NAV_SELECTOR} ${api.core.ns.selector('nav__list')}`;

let count = 0;

class Header {
  constructor (header) {
    this.header = header || document.querySelector(HEADER_SELECTOR);
    this.numId = count;
    count++;
    this.modals = [];

    this.init();
  }

  getModal (element) {
    if (!element) return;
    const modals = api.core.Instance.getInstances(element, api.Modal);
    if (!modals || !modals.length) return;
    this.modals.push(modals[0]);
  }

  init () {
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
  }

  change () {
    this.isLarge = window.matchMedia('(min-width: 62em)').matches;

    if (this.isLarge) {
      for (let i = 0; i < this.modals.length; i++) {
        this.modals[i].conceal();
        this.modals[i].element.style.transition = 'none';
      }
    } else {
      for (let i = 0; i < this.modals.length; i++) {
        this.modals[i].element.style.transition = '';
      }
    }

    if (this.shortcuts !== null) {
      if (this.isLarge) {
        if (this.searchBar !== null) this.tools.insertBefore(this.shortcuts, this.searchBar);
        else this.tools.appendChild(this.shortcuts);
      } else {
        this.nav.insertBefore(this.shortcuts, this.navList);
      }
    }
  }
}

api.Header = Header;

const build = () => {
  const elements = Array.prototype.slice.call(document.querySelectorAll(HEADER_SELECTOR));

  const headers = [];

  for (const element of elements) headers.push(new Header(element));
};

/* eslint-disable no-new */

new api.core.Initializer(HEADER_SELECTOR, [build]);
//# sourceMappingURL=header.module.js.map
