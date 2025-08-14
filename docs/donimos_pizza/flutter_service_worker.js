'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "b774629211a204bf1702364e030e337e",
"assets/AssetManifest.bin.json": "8cdeeb42d7b10d03ffaaae16fbda4c81",
"assets/AssetManifest.json": "00f4b8901632a8d2cb55a8add1b77ef8",
"assets/assets/beverages/bev_1.png": "692e79c53da69af34c4fbb8a3bb4406d",
"assets/assets/beverages/bev_10.png": "d0860fe48755f0c3f76cc8590fcabd6d",
"assets/assets/beverages/bev_11.png": "3c5aa51d3b688391f86f90d184207868",
"assets/assets/beverages/bev_12.png": "6c8d1d29e0bd21b7bc13a814387b2184",
"assets/assets/beverages/bev_13.png": "d2082695d3326217d83f9ba5048f8aee",
"assets/assets/beverages/bev_14.png": "79eeb9fb9f6a0f668579b84c0fdf7442",
"assets/assets/beverages/bev_15.png": "f2fa386d208cd1e425d85f142383fd33",
"assets/assets/beverages/bev_16.png": "414ec1e251e9d949bbefb581b2cb3495",
"assets/assets/beverages/bev_17.png": "879e95a41473a2c55fe8dcb417a0b48e",
"assets/assets/beverages/bev_18.png": "a145ee9d674e673ac22efd5f5acab9aa",
"assets/assets/beverages/bev_19.png": "4295dbd8b71d292864d2afe992e5b8c7",
"assets/assets/beverages/bev_2.png": "16a901364ffa51a0d02278fa7758131e",
"assets/assets/beverages/bev_20.png": "aee880081f4f15603df063b159fb51cb",
"assets/assets/beverages/bev_3.png": "23bba1c233a1321047901daa8455f852",
"assets/assets/beverages/bev_4.png": "5d859d02118f771204cc3ab84e80406c",
"assets/assets/beverages/bev_5.png": "24cb84650319c0b3f39e562d44b95c65",
"assets/assets/beverages/bev_6.png": "dd68e4b36056344256c09ca4e841f746",
"assets/assets/beverages/bev_7.png": "25b9c76352c8bd1934dc1e7f7741f93e",
"assets/assets/beverages/bev_8.png": "2cdb1da2ec194b424ce3556980a1a1c9",
"assets/assets/beverages/bev_9.png": "f5a207cb016688e1d1f1ff29d0077b08",
"assets/assets/garlic/garlic_1.png": "9a137aa98cf10ffcf27f597c03dadf29",
"assets/assets/garlic/garlic_10.png": "5f33035777804cc6d0bee3717032d6ee",
"assets/assets/garlic/garlic_2.png": "f131d2b77c9b6d535ecd1f9a69865aa7",
"assets/assets/garlic/garlic_3.png": "3eac810e33a9be41ad5241c58e4d946b",
"assets/assets/garlic/garlic_4.png": "5e9f5dfa7a7535bd89be4264f4799ceb",
"assets/assets/garlic/garlic_5.png": "cf7c86d1138185ba56867cd5dc9fd990",
"assets/assets/garlic/garlic_6.png": "19165b1092376d1b4590af293267519b",
"assets/assets/garlic/garlic_7.png": "5e79f161cd0acf82f19e2f11ecb0fca9",
"assets/assets/garlic/garlic_8.png": "bfd86d77d672629368d8a49e87c3d1a5",
"assets/assets/garlic/garlic_9.png": "4a97164c705943c8948dac7a7afc046a",
"assets/assets/pizzas/pizza_1.png": "67ac88d2200c7993c6c5ad171bc568e3",
"assets/assets/pizzas/pizza_10.png": "9d710782c3fe202097a7c35733293b17",
"assets/assets/pizzas/pizza_11.png": "4c7cac9e5521c9038bf25f6116ac04e0",
"assets/assets/pizzas/pizza_12.png": "be95801f2b780ef4e2c616a1fa22bfcd",
"assets/assets/pizzas/pizza_13.png": "636615fa12bab334e12ce8e0035792ba",
"assets/assets/pizzas/pizza_14.png": "e5e19c9a1ec2fa8f175818f976603ef1",
"assets/assets/pizzas/pizza_15.png": "abbaed5ab4fce07bbb634a8cdbaa86d0",
"assets/assets/pizzas/pizza_16.png": "d7908e981a3a3f95776527f931e1f59a",
"assets/assets/pizzas/pizza_17.png": "e0e512e6d6108947900872ee28212ef7",
"assets/assets/pizzas/pizza_18.png": "ea55b07a600e87202bd675d9986ba216",
"assets/assets/pizzas/pizza_19.png": "394cb299270930dee231c494c2a33660",
"assets/assets/pizzas/pizza_2.png": "df96407a8b0fe04f2f08abf368908fad",
"assets/assets/pizzas/pizza_20.png": "12b4181202d144a79db6bb71dee744b2",
"assets/assets/pizzas/pizza_3.png": "f8c2e160828278915e63d1d5ea49a81c",
"assets/assets/pizzas/pizza_4.png": "df96407a8b0fe04f2f08abf368908fad",
"assets/assets/pizzas/pizza_5.png": "2b6bbee3fa01d7b38ca93c48dfb4a01e",
"assets/assets/pizzas/pizza_6.png": "b493cb4c3a218fb184e7a9a9589423e0",
"assets/assets/pizzas/pizza_7.png": "47c3e26e95abe47f4310f4fe2178465c",
"assets/assets/pizzas/pizza_8.png": "49b607036186ff10c7d0258fa104db5c",
"assets/assets/pizzas/pizza_9.png": "ea55b07a600e87202bd675d9986ba216",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "0a150552590ed9d849cccfb15e8e74f5",
"assets/NOTICES": "d66eff6c94c713e0be40fce0b8ecaed0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "2a4d72448a572ac533febbe6ee020dfc",
"index.html": "c367947e4104205a46c05041a33169d1",
"/": "c367947e4104205a46c05041a33169d1",
"main.dart.js": "05bd3952228b0a9b7d16f8d14108782c",
"version.json": "4467cf84d981d12b5889801000269796"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
