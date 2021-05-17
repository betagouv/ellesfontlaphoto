/*! DSFR v0.6.0 | licence MIT */

(function () {
	'use strict';

	var namespace = 'dsfr';

	var api = window[namespace] || { core: {} };
	window[namespace] = api;

	var SIDEMENU_CLASS = api.core.ns('sidemenu');
	var SIDEMENU_LIST_CLASS = api.core.ns('sidemenu__list');

	/* eslint-disable no-new */

	api.Collapse.register(SIDEMENU_CLASS, SIDEMENU_LIST_CLASS);

}());
//# sourceMappingURL=sidemenu.nomodule.js.map
