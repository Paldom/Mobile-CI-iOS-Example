#!/usr/bin/ruby

require "active_support/core_ext/hash/indifferent_access"

class CONFIG

    PROJECT_NAME = "MobileCI"

    ENVIRONMENT = {
        mock: {
            bundle_id: "hu.dpal-demo.MobileCI.mock",
            scheme: "MobileCIMock",
            gsp_file: "GoogleService-Info-mock.plist"
        },
        dev: {
            bundle_id: "hu.dpal-demo.MobileCI.dev",
            scheme: "MobileCIDev",
            gsp_file: "GoogleService-Info-dev.plist"
        },
        test: {
            bundle_id: "hu.dpal-demo.MobileCI.test",
            scheme: "MobileCITest",
            gsp_file: "GoogleService-Info-test.plist"
        },
        prod: {
            bundle_id: "hu.dpal-demo.MobileCI",
            scheme: "MobileCI",
            gsp_file: "GoogleService-Info.plist"
        }
    }.with_indifferent_access

end
