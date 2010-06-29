/** 
* jTexBar 0.1
* @author: Anders Fajerson 
*
* Based on Michael Geary's TextBar module
* (http://mg.to/2005/02/26/textbar-drupal-module-for-markdown-and-textile), which was
* adapted from the DokuWiki toolbar (http://wiki.splitbrain.org/wiki:dokuwiki), which was
* adapted from the MediaWiki toolbar (http://wikipedia.sourceforge.net/), which was
* adapted from the phpBB toolbar (http://www.phpbb.com/).
* Plugin structure based on Steven Wittens' Farbtastic plugin (http://www.acko.net/dev/farbtastic). 
* @license: GPL
*/

jQuery.fn.jtextbar = function (settings) {
  var objects = this.each(function(){
    jQuery.jtextbar(this, settings);
  });
  return objects;
};

jQuery.jtextbar = function (element, settings) {
  var element = jQuery(element).get(0);
  return element.jtextbar || (element.jtextbar = new jQuery._jtextbar(element, settings));
};

jQuery._jtextbar = function (element, settings) {
  // Store jtextbar object
  var tb = this;
  
  /**
  * Settings
  */
  // User defined settings
  tb.settings = settings;
  // Merge user defined settings with defaults
  tb.settings = jQuery.extend({
    format: "Markdown",
    buttons: [
      //[type, shortcutKey, name, sampleText(toolTip), toolTip, [subMenu]]
      ['simple', 'b', 'bold', 'Bold Text'],
      ['simple', 'i', 'italic', 'Italic Text'],
      ['simple', null, 'listul', 'Unordered List Item'],
      ['simple', null, 'list', 'Ordered List Item'],
      ['menu', null, 'h', 'Headline', null, [
        ['simple', '1', 'h1', 'Level 1 Headline'],
        ['simple', '2', 'h2', 'Level 2 Headline'],
        ['simple', '3', 'h3', 'Level 3 Headline']
      ]],
      ['linker', 'l', 'link', 'link text', 'Internal Link'],
      ['linker', 'm', 'image', 'alt text', 'Image'],
      ['menu', null, 'more', 'More', null, [
       ['linker', null, 'extlink', 'link text', 'External Link'],
       ['insert', null, 'rule', 'Horizontal Rule'],
       ['simple', null, 'code', 'Code Text']
      ]]
    ],
    tagsets: {
      Markdown: {
        bold: ['**', '**'],
        italic: ['*', '*'],
        code: ['`', '`'],
        h: ['# ', ''],
        h1: ['# ', ''],
        h2: ['## ', ''],
        h3: ['### ', ''],
        h4: ['#### ', ''],
        h5: ['##### ', ''],
        link: ['[', '](page-name "tooltip")'],
        extlink: ['[', '](http://www.example.com/ "tooltip")'],
        list: ['1. ', '\n'],
        listul: ['* ', '\n'],
        rule: ['----\n'],
        image: ['![', '](/path/to/img.jpg "tooltip")'] 
      },
      Textile: {
        bold: [ '*', '*'],
        italic: [ '_', '_'],
        code: [ '@', '@'],
        h: ['# ', ''],
        h1: ['h1. ', ''],
        h2: ['h2. ', ''],
        h3: ['h3. ', ''],
        h4: ['h4. ', ''],
        h5: ['h5. ', ''],
        link: ['"', '":page-name'],
        extlink: ['"', '":http://www.example.com/'],
        list: ['# ', '\n'],
        listul: ['* ', '\n'],
        rule: ['<hr />\n'],
        image: ['!/path/to/img.jpg(', ')!']
      }
    }
  }, tb.settings);
  
  tb.escapeQuotes = function (text) {
    return text.replace( /'/g, "\\'" ).replace( /"/g, '&quot;' ).replace( /\n/g, "\\n" );
  };
  
  /**
  * Format the toolbar buttons
  */
  tb.formatButtons = function (buttons) {
    var html = "";
    var position = 0;
    for(var i = 0;  i < buttons.length;  i++) {
      var button = buttons[i];
      var type = button[0];
      var accessKey = button[1];
      var name = button[2];
      var sampleText = button[3];
      var toolTip = button[4]; 
      var subMenu = button[5];
      sampleText = tb.escapeQuotes(sampleText);
      toolTip = (toolTip ? tb.escapeQuotes(toolTip) : sampleText);
      var toolTipAndKey = (accessKey ? toolTip + ' [Ctrl+' + accessKey.toUpperCase() + ']' : toolTip);
      var fn = 'jQuery.jtextbar(\'#' + element.id + '\').clickButton(\'' + type + '\',\'' + name + '\',\'' + sampleText + '\')';
      var imgURL = "toolbar.png";
      
      // store keyboard shortcuts for use in keyShortcuts()
      if (accessKey) {
        tb.keys[accessKey] = new Object;
        tb.keys[accessKey].fn = fn;
      }
      
      if (subMenu && type == "menu") {
        html += '<li class="' + name + ' menu" title="' + toolTipAndKey + '"';
        html += 'onclick="' + fn + '">';
        html += toolTip;
        html += '<ul style="display:none">';
        html += tb.formatButtons(subMenu);
        html += "</ul></li>";
      }
      else {
        html += '<li class="' + name + '" title="' + toolTipAndKey + '"';
        html += 'onclick="' + fn + '">';
        html += toolTip + '</li>';
      }
    }
    return html;
  };
  
  /**
  * Apply tagOpen/tagClose to selection in textarea, use sampleText instead
  * of selection if there is none.
  *
  * @author phpBB development team
  * @author MediaWiki development team
  * @author Andreas Gohr <andi@splitbrain.org>
  * @author Jim Raynor <jim_raynor@web.de>
  */
  tb.insertTags = function (tagOpen, tagClose, sampleText) {
    tagClose = tagClose || '';
    var txtarea = jQuery(element).get(0);
    
    if (document.selection && !jQuery.browser.mozilla) {  // IE
      var theSelection = document.selection.createRange().text;
      var replaced = true;
      if (!theSelection) {
          replaced = false;
          theSelection = sampleText;
      }
      txtarea.focus();
      // This has changed
      var text = theSelection;
      if (theSelection.charAt(theSelection.length-1) == " ") { // exclude ending space char, if any
          theSelection = theSelection.substring( 0, theSelection.length - 1 );
          r = document.selection.createRange();
          r.text = tagOpen + theSelection + tagClose + " ";
      }
      else {
          r = document.selection.createRange();
          r.text = tagOpen + theSelection + tagClose;
      }
      if (!replaced) {
          r.moveStart( 'character', -text.length - tagClose.length );
          r.moveEnd( 'character', -tagClose.length );
      }
      r.select();
    }
    else if (txtarea.selectionStart || txtarea.selectionStart == '0') { // Mozilla
      var startPos = txtarea.selectionStart;
      var endPos   = txtarea.selectionEnd;
      var replaced = (endPos - startPos);
      var scrollTop = txtarea.scrollTop;
      var myText = txtarea.value.substring( startPos, endPos )  ||  sampleText;

      if ( myText.charAt(myText.length-1) == " " )  // exclude ending space char, if any
          subst = tagOpen + myText.substring( 0, myText.length - 1 ) + tagClose + " ";
      else subst = tagOpen + myText + tagClose;
      txtarea.value = tb.insertString( txtarea.value, startPos, endPos, subst );
      txtarea.focus();
      // set new selection
      if (replaced)
        txtarea.selectionStart = txtarea.selectionEnd = startPos + tagOpen.length + myText.length + tagClose.length;
      else {
        txtarea.selectionStart = startPos + tagOpen.length;
        txtarea.selectionEnd = txtarea.selectionStart + myText.length;
        txtarea.scrollTop = scrollTop;
      }
    }
    else { // All other browsers
      var copy_alertText = alertText; //TODO: alertText is not specified...
      var re1 = new RegExp( "\\$1", "g" );
      var re2 = new RegExp( "\\$2", "g" );
      copy_alertText = copy_alertText.replace( re1, sampleText );
      copy_alertText = copy_alertText.replace( re2, tagOpen + sampleText + tagClose );
      var text = ( sampleText ? prompt(copy_alertText) : '' ) || sampleText;
      text = tagOpen + text + tagClose;
      txtarea.value += "\n" + text;
      // In Safari this causes scrolling
      if (!jQuery.browser.safari) txtarea.focus();
    }
    // Reposition cursor if possible
    if (txtarea.createTextRange) txtarea.caretPos = document.selection.createRange().duplicate();
  };

  /*
  * Insert the given value at the current cursor position
  * @see http://www.alexking.org/index.php?content=software/javascript/content.php
  */
  tb.insertText = function (value) {
    var field = jQuery(element).get(0);;
    if (document.selection) { // IE
      field.focus();
      (opener ? opener.document : document).selection.createRange().text = value;
    }
    else if (field.selectionStart || field.selectionStart == '0') { // MOZILLA/NETSCAPE
      var startPos = field.selectionStart;
      var scrollTop = field.scrollTop;
      field.value = tb.insertString( field.value, startPos, field.selectionEnd, value );
      field.focus();
      field.selectionStart = field.selectionEnd = startPos + value.length;
      field.scrollTop = scrollTop;
    }
    else
      field.value += "\n" + value;
    // Reposition cursor if possible
    if (field.createTextRange)
      field.caretPos = document.selection.createRange().duplicate();
  };

  /**
  * Replace a specified range in a target string with a new string.
  */
  tb.insertString = function (target, iStart, iEnd, insert) {
    return target.substring(0, iStart) + insert + target.substring(iEnd, target.length);
  };

  /**
  * Keyboard shortcuts
  */
  tb.keys = {};
  tb.keyShortcuts = function () {
    jQuery(element).keydown(function(e) {
      var keyPressed = String.fromCharCode(e.keyCode).toLowerCase(); //convert Unicode number to lowercase character
      if (keyPressed in tb.keys) {
        for(key in tb.keys) {
          if (keyPressed == key && e.ctrlKey) {
            eval(tb.keys[key].fn); //execute the key's function
            return false;
          }
        }
      }
    });
//     //Stop default keyboard shortcut in Opera. TODO: Better way?
//     .keypress(function(e) {
// 	    e.preventDefault();
//     });
  };
  
  /**
  * Handle a click on a toolbar button
  */
  tb.clickButton = function(type, code, sampleText) {
    // Get format for this jtextbar
    var format = tb.settings.format;
    var tags = tb.settings.tagsets[format][code];
    // Define actions
    var actions = {
      insert: function() {
        tb.insertText(tags[0]);
      },
      linker: function() {
        tb.insertTags(tags[0], tags[1], sampleText);
      },
      simple: function() {
        tb.insertTags(tags[0], tags[1], sampleText);
      },
      menu: function() {
        //Do nothing
      }
    };
    // Perform action
    actions[type]();
  };
  
  /**
  * Add events to a rendered toolbar
  */
  tb.menuEvents  =  function() {
    // Reset events
    tb.isClicked = false;
    // jQuery(document).unclick();
    
    jQuery("li.menu", tb.toolbar).mousedown(function(){
      // Store that a toolbar button has been clicked
      tb.isClicked = true;
    }).click(function(){
      tb.toggleSubMenus(tb.toolbar, this);
    });
  
    jQuery(document).click(function(){
      if (!tb.isClicked)
        tb.toggleSubMenus(tb.toolbar);
      tb.isClicked = false;
    });
    
    // Add events for IE, all others use css only
    if(jQuery.browser.msie) { 
      // IE6 doesn't support multiple class use <span> instead
      jQuery("li", tb.toolbar).wrap("<span></span>")
      .mousedown(function(){
        jQuery(this).parent().addClass('IE-active')
      }).mouseup(function(){ 
        jQuery(this).parent().removeClass('IE-active')
      });
      
      jQuery("li ul li", tb.toolbar).hover(function(){
        jQuery(this).addClass('IE-hover');
      },function(){
        jQuery(this).removeClass('IE-hover');}
      );
    }
  };
  
  tb.toggleSubMenus = function (toolbar, that){
    if (!tb.isClicked) {
      jQuery(".jtextbar-toolbar li.menu ul").hide()
    }
    else {
      // Hide all submenus except the one clicked //TODO: simplify not()
      jQuery(".jtextbar-toolbar li.menu ul").not(that.getElementsByTagName("ul")[0]).hide();
      var ul = jQuery("ul", that);
      if (ul.is(":hidden")) {
        ul.fadeIn("fast");
      }
      else {
        ul.hide();
      }
    }
  };
  
  // Toolbar markup
  var html = '<ul class="jtextbar-toolbar">' + tb.formatButtons(tb.settings.buttons) + '</ul>';
  // Store and insert toolbar
  tb.toolbar = jQuery('"' + html + '"').insertBefore(element);
  // Add menu events 
  tb.menuEvents();
  // Add keyboard shortcuts 
  tb.keyShortcuts();
}