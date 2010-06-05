/* Any copyright is dedicated to the Public Domain.
 * http://creativecommons.org/publicdomain/zero/1.0/
 */

let testWindow = null;
function test() {
  waitForExplicitFinish();
  testWindow = OpenBrowserWindow();
  testWindow.addEventListener("load", function() {
    testWindow.removeEventListener("load", arguments.callee, true);
    ok(true, "Load listener called");
    executeSoon(function() {
      ok(!testWindow.gFindBarInitialized, "find bar is not yet initialized");
      testWindow.gBrowser.selectedBrowser.addEventListener("pageshow", function () {
        ok(true, "Pageshow listener called");
        testWindow.gBrowser.selectedBrowser.removeEventListener("pageshow", arguments.callee, false);
        waitForFocus(onFocus, testWindow.content);
      }, true);
      testWindow.content.location = "data:text/html,<h1>A Page</h1>";
    });
  }, false);
}

function onFocus() {
  EventUtils.synthesizeKey("/", {});
  ok(testWindow.gFindBarInitialized, "find bar is now initialized");
  testWindow.gFindBar.close();
  testWindow.close();
  finish();
}
