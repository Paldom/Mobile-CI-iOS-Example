#!/usr/bin/ruby

require "active_support/core_ext/hash/indifferent_access"

class CONFIG

    PROJECT_NAME = "MobileCI"

    ENVIRONMENT = {
        mock: {
            bundle_id: "hu.dpal-demo.MobileCI.mock",
            scheme: "MobileCIMock",
            gsp_file: "GoogleService-Info-mock.plist",
            firebase_app_id: "1:553594402808:ios:fc35c392f044d92f"
        },
        dev: {
            bundle_id: "hu.dpal-demo.MobileCI.dev",
            scheme: "MobileCIDev",
            gsp_file: "GoogleService-Info-dev.plist",
            firebase_app_id: "1:553594402808:ios:c9ab33e07d84926e"
        },
        test: {
            bundle_id: "hu.dpal-demo.MobileCI.test",
            scheme: "MobileCITest",
            gsp_file: "GoogleService-Info-test.plist",
            firebase_app_id: "1:553594402808:ios:f0542948653b4d79"
        },
        prod: {
            bundle_id: "hu.dpal-demo.MobileCI",
            scheme: "MobileCI",
            gsp_file: "GoogleService-Info.plist",
            firebase_app_id: "1:553594402808:ios:7f485435e5836147"
        }
    }.with_indifferent_access

end
