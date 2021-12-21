import MapboxMaps
import MapboxDirections
import MapboxCoreNavigation
import MapboxNavigation

class CustomNightStyle: NightStyle {

    required init() {
        super.init()

        ///mapStyleURL = MGLStyle.navigationNightStyleURL
        ///previewMapStyleURL = MGLStyle.navigationNightStyleURL
        // Specify that the style should be used at night.
        styleType = .night
    }

    override func apply() {
        super.apply()

        // Begin styling the UI
        //BottomBannerView.appearance().backgroundColor = .purple
    }
}