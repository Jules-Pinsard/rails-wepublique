import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [4.946408568448533, 48.63728818198206],
      zoom: 11
    })
    this.#addMarkersToMap()
    this.map.on('click', (e) => {
      const lat = e.lngLat.wrap()["lat"]
      const long = e.lngLat.wrap()["lng"]
      document.getElementById("observation_latitude").value = lat
      document.getElementById("observation_longitude").value = long
      if (document.getElementById("observation_location")) {
        if (this.marker) {
          this.marker.remove()
        }
        const location = document.getElementById("observation_location")
        location.placeholder = "Position déjà placée sur la carte"
        location.disabled = true
        this.marker = new mapboxgl.Marker()
          .setLngLat([long, lat])
          .setPopup(new mapboxgl.Popup().setHTML("<h5>La position choisie</h5>"))
          .addTo(this.map)
      }
    });
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      new mapboxgl.Marker({color: marker.color})
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)

    })
  }
}
