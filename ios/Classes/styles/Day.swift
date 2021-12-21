import MapboxMaps
import MapboxDirections
import MapboxCoreNavigation
import MapboxNavigation

class CustomDayStyle: DayStyle {

    required init() {
        super.init()
        initStyle()
    }

    init(url: String?){

        super.init()
        initStyle()
        if(url != nil)
        {
            ///mapStyleURL = URL(string: url!) ?? MGLStyle.navigationDayStyleURL
            ///previewMapStyleURL = URL(string: url!) ?? MGLStyle.navigationDayStyleURL
        }
    }

    func initStyle()
    {
        // Use a custom map style.
        ///mapStyleURL = MGLStyle.navigationDayStyleURL
        ///previewMapStyleURL = MGLStyle.navigationDayStyleURL

        // Specify that the style should be used during the day.
        styleType = .day
    }

    override func apply() {
        super.apply()

        // Begin styling the UI
        //BottomBannerView.appearance().backgroundColor = .orange
    }
}