'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "f5fffef9e594eff2f44c70fdbc239778",
"assets/assets/icons/brifecase-timer-bulk.svg": "522f6417a6647645f0b7ef3e08cd51da",
"assets/assets/icons/brifecase-timer-twoTone.svg": "60bcc0bd74d00a255b62e0e93e8df828",
"assets/assets/icons/code-1-bulk.svg": "b72a4b264f8f4ca90db5df2874b1597d",
"assets/assets/icons/code-1-twoTone.svg": "b17245a19d7af249767cc9358e00b356",
"assets/assets/icons/diamonds-bulk.svg": "5300711a95ceeb59ee0f60a4a0d725a1",
"assets/assets/icons/home-1-bulk.svg": "d47a64202ad911a280fda2b2be75d0aa",
"assets/assets/icons/home-1-twoTone.svg": "16c0834d4b2935c542ed5c3f6282ed56",
"assets/assets/icons/teacher-bulk.svg": "89cecd45e20dcd891f95b45e2aadfd3c",
"assets/assets/icons/teacher-twoTone.svg": "5e83c5afcb7fdd5e18881a3d6813ab7d",
"assets/assets/images/logo.png": "c96ac35c29de30109b5a451922d2fe63",
"assets/assets/images/original.png": "5829508cc0e7171708a03f30cbd92360",
"assets/assets/images/original_circle.png": "726cd5b027deffdab101cc62a2865896",
"assets/assets/images/original_circle_blue.png": "60314e4383c565ac96c80b217d277be1",
"assets/assets/images/original_circle_transparent.png": "a10fa356046486c2a2a695e2846d0041",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "4e3febd921ab3f30058cc2ee96216bce",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/shaders/ink_sparkle.frag": "b3836643476ab337b8367f4790f9e4ab",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"favicon.png": "f6cd56178d81597b13833546213d7cac",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"icons/Icon-192.png": "e425d1ce656c92682bdb294fc7731dd1",
"icons/Icon-512.png": "b4cb27e260ec9b6610e16de58601e894",
"icons/Icon-maskable-192.png": "e425d1ce656c92682bdb294fc7731dd1",
"icons/Icon-maskable-512.png": "b4cb27e260ec9b6610e16de58601e894",
"index.html": "c8d67cf27c7b90f4cf151eb2232ed369",
"/": "c8d67cf27c7b90f4cf151eb2232ed369",
"main.dart.js": "969c64083321303f0fdb622fa2479384",
"manifest.json": "23a31f8745f444aded6ba36ae4f8be3c",
"splash/img/dark-1x.png": "64d254978522e52d5ca5bbaecc8d1f83",
"splash/img/dark-2x.png": "be2791da0ce9b79daa6334d3a477c249",
"splash/img/dark-3x.png": "e9bbd39a6a2f60738aadaa96e3d376de",
"splash/img/dark-4x.png": "e849fcabb38d3b3043994e895f48868c",
"splash/img/light-1x.png": "64d254978522e52d5ca5bbaecc8d1f83",
"splash/img/light-2x.png": "be2791da0ce9b79daa6334d3a477c249",
"splash/img/light-3x.png": "e9bbd39a6a2f60738aadaa96e3d376de",
"splash/img/light-4x.png": "e849fcabb38d3b3043994e895f48868c",
"splash/splash.js": "d6c41ac4d1fdd6c1bbe210f325a84ad4",
"splash/style.css": "704495dcb8fb4ca4f7ef2a1831fe6fe3",
"version.json": "550643295ab7e6959d768fbb46c8fe37"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
