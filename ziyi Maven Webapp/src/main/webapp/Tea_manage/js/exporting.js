/*
 Highcharts JS v6.1.2 (2018-08-31)
 Exporting module

 (c) 2010-2017 Torstein Honsi

 License: www.highcharts.com/license
*/
(function(g) {
    "object" === typeof module && module.exports ? module.exports = g : "function" === typeof define && define.amd ? define(function() {
        return g
    }) : g(Highcharts)
}
)(function(g) {
    (function(f) {
        var g = f.defaultOptions
          , z = f.doc
          , A = f.Chart
          , q = f.addEvent
          , I = f.removeEvent
          , C = f.fireEvent
          , r = f.createElement
          , D = f.discardElement
          , u = f.css
          , p = f.merge
          , B = f.pick
          , k = f.each
          , F = f.objectEach
          , t = f.extend
          , J = f.isTouchDevice
          , E = f.win
          , G = E.navigator.userAgent
          , K = f.Renderer.prototype.symbols;
        /Edge\/|Trident\/|MSIE /.test(G);
        /firefox/i.test(G);
        t(g.lang, {
            printChart: "Print chart",
            downloadPNG: "Download PNG image",
            downloadJPEG: "Download JPEG image",
            downloadPDF: "Download PDF document",
            downloadSVG: "Download SVG vector image",
            contextButtonTitle: "Chart context menu"
        });
        g.navigation = {
            buttonOptions: {
                theme: {},
                symbolSize: 14,
                symbolX: 12.5,
                symbolY: 10.5,
                align: "right",
                buttonSpacing: 3,
                height: 22,
                verticalAlign: "top",
                width: 24
            }
        };
        p(!0, g.navigation, {
            menuStyle: {
                border: "1px solid #999999",
                background: "#ffffff",
                padding: "5px 0"
            },
            menuItemStyle: {
                padding: "0.5em 1em",
                background: "none",
                color: "#333333",
                fontSize: J ? "14px" : "11px",
                transition: "background 250ms, color 250ms"
            },
            menuItemHoverStyle: {
                background: "#335cad",
                color: "#ffffff"
            },
            buttonOptions: {
                symbolFill: "#666666",
                symbolStroke: "#666666",
                symbolStrokeWidth: 3,
                theme: {
                    fill: "#ffffff",
                    stroke: "none",
                    padding: 5
                }
            }
        });
        g.exporting = {
            type: "image/png",
            url: "https://export.highcharts.com/",
            printMaxWidth: 780,
            scale: 2,
            buttons: {
                contextButton: {
                    className: "highcharts-contextbutton",
                    menuClassName: "highcharts-contextmenu",
                    symbol: "menu",
                    _titleKey: "contextButtonTitle",
                    menuItems: "printChart separator downloadPNG downloadJPEG downloadPDF downloadSVG".split(" ")
                }
            },
            menuItemDefinitions: {
                printChart: {
                    textKey: "printChart",
                    onclick: function() {
                        this.print()
                    }
                },
                separator: {
                    separator: !0
                },
                downloadPNG: {
                    textKey: "downloadPNG",
                    onclick: function() {
                        this.exportChart()
                    }
                },
                downloadJPEG: {
                    textKey: "downloadJPEG",
                    onclick: function() {
                        this.exportChart({
                            type: "image/jpeg"
                        })
                    }
                },
                downloadPDF: {
                    textKey: "downloadPDF",
                    onclick: function() {
                        this.exportChart({
                            type: "application/pdf"
                        })
                    }
                },
                downloadSVG: {
                    textKey: "downloadSVG",
                    onclick: function() {
                        this.exportChart({
                            type: "image/svg+xml"
                        })
                    }
                }
            }
        };
        f.post = function(a, b, e) {
            var c = r("form", p({
                method: "post",
                action: a,
                enctype: "multipart/form-data"
            }, e), {
                display: "none"
            }, z.body);
            F(b, function(a, b) {
                r("input", {
                    type: "hidden",
                    name: b,
                    value: a
                }, null, c)
            });
            c.submit();
            D(c)
        }
        ;
        t(A.prototype, {
            sanitizeSVG: function(a, b) {
                if (b && b.exporting && b.exporting.allowHTML) {
                    var e = a.match(/<\/svg>(.*?$)/);
                    e && e[1] && (e = '\x3cforeignObject x\x3d"0" y\x3d"0" width\x3d"' + b.chart.width + '" height\x3d"' + b.chart.height + '"\x3e\x3cbody xmlns\x3d"http://www.w3.org/1999/xhtml"\x3e' + e[1] + "\x3c/body\x3e\x3c/foreignObject\x3e",
                    a = a.replace("\x3c/svg\x3e", e + "\x3c/svg\x3e"))
                }
                a = a.replace(/zIndex="[^"]+"/g, "").replace(/isShadow="[^"]+"/g, "").replace(/symbolName="[^"]+"/g, "").replace(/jQuery[0-9]+="[^"]+"/g, "").replace(/url\(("|&quot;)(\S+)("|&quot;)\)/g, "url($2)").replace(/url\([^#]+#/g, "url(#").replace(/<svg /, '\x3csvg xmlns:xlink\x3d"http://www.w3.org/1999/xlink" ').replace(/ (|NS[0-9]+\:)href=/g, " xlink:href\x3d").replace(/\n/, " ").replace(/<\/svg>.*?$/, "\x3c/svg\x3e").replace(/(fill|stroke)="rgba\(([ 0-9]+,[ 0-9]+,[ 0-9]+),([ 0-9\.]+)\)"/g, '$1\x3d"rgb($2)" $1-opacity\x3d"$3"').replace(/&nbsp;/g, "\u00a0").replace(/&shy;/g, "\u00ad");
                this.ieSanitizeSVG && (a = this.ieSanitizeSVG(a));
                return a
            },
            getChartHTML: function() {
                return this.container.innerHTML
            },
            getSVG: function(a) {
                var b, e, c, v, m, h = p(this.options, a);
                e = r("div", null, {
                    position: "absolute",
                    top: "-9999em",
                    width: this.chartWidth + "px",
                    height: this.chartHeight + "px"
                }, z.body);
                c = this.renderTo.style.width;
                m = this.renderTo.style.height;
                c = h.exporting.sourceWidth || h.chart.width || /px$/.test(c) && parseInt(c, 10) || 600;
                m = h.exporting.sourceHeight || h.chart.height || /px$/.test(m) && parseInt(m, 10) || 400;
                t(h.chart, {
                    animation: !1,
                    renderTo: e,
                    forExport: !0,
                    renderer: "SVGRenderer",
                    width: c,
                    height: m
                });
                h.exporting.enabled = !1;
                delete h.data;
                h.series = [];
                k(this.series, function(a) {
                    v = p(a.userOptions, {
                        animation: !1,
                        enableMouseTracking: !1,
                        showCheckbox: !1,
                        visible: a.visible
                    });
                    v.isInternal || h.series.push(v)
                });
                k(this.axes, function(a) {
                    a.userOptions.internalKey || (a.userOptions.internalKey = f.uniqueKey())
                });
                b = new f.Chart(h,this.callback);
                a && k(["xAxis", "yAxis", "series"], function(c) {
                    var d = {};
                    a[c] && (d[c] = a[c],
                    b.update(d))
                });
                k(this.axes, function(a) {
                    var c = f.find(b.axes, function(b) {
                        return b.options.internalKey === a.userOptions.internalKey
                    })
                      , d = a.getExtremes()
                      , e = d.userMin
                      , d = d.userMax;
                    c && (void 0 !== e && e !== c.min || void 0 !== d && d !== c.max) && c.setExtremes(e, d, !0, !1)
                });
                c = b.getChartHTML();
                C(this, "getSVG", {
                    chartCopy: b
                });
                c = this.sanitizeSVG(c, h);
                h = null;
                b.destroy();
                D(e);
                return c
            },
            getSVGForExport: function(a, b) {
                var e = this.options.exporting;
                return this.getSVG(p({
                    chart: {
                        borderRadius: 0
                    }
                }, e.chartOptions, b, {
                    exporting: {
                        sourceWidth: a && a.sourceWidth || e.sourceWidth,
                        sourceHeight: a && a.sourceHeight || e.sourceHeight
                    }
                }))
            },
            exportChart: function(a, b) {
                b = this.getSVGForExport(a, b);
                a = p(this.options.exporting, a);
                f.post(a.url, {
                    filename: a.filename || "chart",
                    type: a.type,
                    width: a.width || 0,
                    scale: a.scale,
                    svg: b
                }, a.formAttributes)
            },
            print: function() {
                var a = this, b = a.container, e = [], c = b.parentNode, f = z.body, m = f.childNodes, h = a.options.exporting.printMaxWidth, d, n;
                if (!a.isPrinting) {
                    a.isPrinting = !0;
                    a.pointer.reset(null, 0);
                    C(a, "beforePrint");
                    if (n = h && a.chartWidth > h)
                        d = [a.options.chart.width, void 0, !1],
                        a.setSize(h, void 0, !1);
                    k(m, function(a, b) {
                        1 === a.nodeType && (e[b] = a.style.display,
                        a.style.display = "none")
                    });
                    f.appendChild(b);
                    setTimeout(function() {
                        E.focus();
                        E.print();
                        setTimeout(function() {
                            c.appendChild(b);
                            k(m, function(a, b) {
                                1 === a.nodeType && (a.style.display = e[b])
                            });
                            a.isPrinting = !1;
                            n && a.setSize.apply(a, d);
                            C(a, "afterPrint")
                        }, 1E3)
                    }, 1)
                }
            },
            contextMenu: function(a, b, e, c, v, m, h) {
                var d = this, n = d.options.navigation, g = d.chartWidth, H = d.chartHeight, p = "cache-" + a, l = d[p], w = Math.max(v, m), x, y;
                l || (d[p] = l = r("div", {
                    className: a
                }, {
                    position: "absolute",
                    zIndex: 1E3,
                    padding: w + "px",
                    pointerEvents: "auto"
                }, d.fixedDiv || d.container),
                x = r("div", {
                    className: "highcharts-menu"
                }, null, l),
                u(x, t({
                    MozBoxShadow: "3px 3px 10px #888",
                    WebkitBoxShadow: "3px 3px 10px #888",
                    boxShadow: "3px 3px 10px #888"
                }, n.menuStyle)),
                y = function() {
                    u(l, {
                        display: "none"
                    });
                    h && h.setState(0);
                    d.openMenu = !1
                }
                ,
                d.exportEvents.push(q(l, "mouseleave", function() {
                    l.hideTimer = setTimeout(y, 500)
                }), q(l, "mouseenter", function() {
                    f.clearTimeout(l.hideTimer)
                }), q(z, "mouseup", function(b) {
                    d.pointer.inClass(b.target, a) || y()
                }), q(l, "click", function() {
                    d.openMenu && y()
                })),
                k(b, function(a) {
                    "string" === typeof a && (a = d.options.exporting.menuItemDefinitions[a]);
                    if (f.isObject(a, !0)) {
                        var b;
                        a.separator ? b = r("hr", null, null, x) : (b = r("div", {
                            className: "highcharts-menu-item",
                            onclick: function(b) {
                                b && b.stopPropagation();
                                y();
                                a.onclick && a.onclick.apply(d, arguments)
                            },
                            innerHTML: a.text || d.options.lang[a.textKey]
                        }, null, x),
                        b.onmouseover = function() {
                            u(this, n.menuItemHoverStyle)
                        }
                        ,
                        b.onmouseout = function() {
                            u(this, n.menuItemStyle)
                        }
                        ,
                        u(b, t({
                            cursor: "pointer"
                        }, n.menuItemStyle)));
                        d.exportDivElements.push(b)
                    }
                }),
                d.exportDivElements.push(x, l),
                d.exportMenuWidth = l.offsetWidth,
                d.exportMenuHeight = l.offsetHeight);
                b = {
                    display: "block"
                };
                e + d.exportMenuWidth > g ? b.right = g - e - v - w + "px" : b.left = e - w + "px";
                c + m + d.exportMenuHeight > H && "top" !== h.alignOptions.verticalAlign ? b.bottom = H - c - w + "px" : b.top = c + m - w + "px";
                u(l, b);
                d.openMenu = !0
            },
            addButton: function(a) {
                var b = this, e = b.renderer, c = p(b.options.navigation.buttonOptions, a), f = c.onclick, m = c.menuItems, h, d, n = c.symbolSize || 12;
                b.btnCount || (b.btnCount = 0);
                b.exportDivElements || (b.exportDivElements = [],
                b.exportSVGElements = []);
                if (!1 !== c.enabled) {
                    var g = c.theme, k = g.states, q = k && k.hover, k = k && k.select, l;
                    delete g.states;
                    f ? l = function(a) {
                        a.stopPropagation();
                        f.call(b, a)
                    }
                    : m && (l = function() {
                        b.contextMenu(d.menuClassName, m, d.translateX, d.translateY, d.width, d.height, d);
                        d.setState(2)
                    }
                    );
                    c.text && c.symbol ? g.paddingLeft = B(g.paddingLeft, 25) : c.text || t(g, {
                        width: c.width,
                        height: c.height,
                        padding: 0
                    });
                    d = e.button(c.text, 0, 0, l, g, q, k).addClass(a.className).attr({
                        "stroke-linecap": "round",
                        title: B(b.options.lang[c._titleKey], "")
                    });
                    d.menuClassName = a.menuClassName || "highcharts-menu-" + b.btnCount++;
                    c.symbol && (h = e.symbol(c.symbol, c.symbolX - n / 2, c.symbolY - n / 2, n, n, {
                        width: n,
                        height: n
                    }).addClass("highcharts-button-symbol").attr({
                        zIndex: 1
                    }).add(d),
                    h.attr({
                        stroke: c.symbolStroke,
                        fill: c.symbolFill,
                        "stroke-width": c.symbolStrokeWidth || 1
                    }));
                    d.add(b.exportingGroup).align(t(c, {
                        width: d.width,
                        x: B(c.x, b.buttonOffset)
                    }), !0, "spacingBox");
                    b.buttonOffset += (d.width + c.buttonSpacing) * ("right" === c.align ? -1 : 1);
                    b.exportSVGElements.push(d, h)
                }
            },
            destroyExport: function(a) {
                var b = a ? a.target : this;
                a = b.exportSVGElements;
                var e = b.exportDivElements, c = b.exportEvents, g;
                a && (k(a, function(a, c) {
                    a && (a.onclick = a.ontouchstart = null,
                    g = "cache-" + a.menuClassName,
                    b[g] && delete b[g],
                    b.exportSVGElements[c] = a.destroy())
                }),
                a.length = 0);
                b.exportingGroup && (b.exportingGroup.destroy(),
                delete b.exportingGroup);
                e && (k(e, function(a, c) {
                    f.clearTimeout(a.hideTimer);
                    I(a, "mouseleave");
                    b.exportDivElements[c] = a.onmouseout = a.onmouseover = a.ontouchstart = a.onclick = null;
                    D(a)
                }),
                e.length = 0);
                c && (k(c, function(a) {
                    a()
                }),
                c.length = 0)
            }
        });
        K.menu = function(a, b, e, c) {
            return ["M", a, b + 2.5, "L", a + e, b + 2.5, "M", a, b + c / 2 + .5, "L", a + e, b + c / 2 + .5, "M", a, b + c - 1.5, "L", a + e, b + c - 1.5]
        }
        ;
        A.prototype.renderExporting = function() {
            var a = this
              , b = a.options.exporting
              , e = b.buttons
              , c = a.isDirtyExporting || !a.exportSVGElements;
            a.buttonOffset = 0;
            a.isDirtyExporting && a.destroyExport();
            c && !1 !== b.enabled && (a.exportEvents = [],
            a.exportingGroup = a.exportingGroup || a.renderer.g("exporting-group").attr({
                zIndex: 3
            }).add(),
            F(e, function(b) {
                a.addButton(b)
            }),
            a.isDirtyExporting = !1);
            q(a, "destroy", a.destroyExport)
        }
        ;
        q(A, "init", function() {
            var a = this;
            k(["exporting", "navigation"], function(b) {
                a[b] = {
                    update: function(e, c) {
                        a.isDirtyExporting = !0;
                        p(!0, a.options[b], e);
                        B(c, !0) && a.redraw()
                    }
                }
            })
        });
        A.prototype.callbacks.push(function(a) {
            a.renderExporting();
            q(a, "redraw", a.renderExporting)
        })
    }
    )(g)
});
