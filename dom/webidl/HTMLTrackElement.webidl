/* -*- Mode: IDL; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * The origin of this IDL file is
 * http://www.whatwg.org/specs/web-apps/current-work/#the-track-element
 */

interface HTMLTrackElement : HTMLElement {
           attribute DOMString kind;
           attribute DOMString src;
           attribute DOMString srclang;
           attribute DOMString label;
// TODOhumph
//           attribute boolean default;

  const unsigned short NONE = 0;
  const unsigned short LOADING = 1;
  const unsigned short LOADED = 2;
  const unsigned short ERROR = 3;
// TODOhumph
//  readonly attribute unsigned short readyState;

// TODOhumph
//  readonly attribute TextTrack track;
};
