# Example configuration from CiscoDevNet/iosxe v1.1.1.
# Review values and platform support before applying to a reserved sandbox.
resource "iosxe_radius_server" "example" {
  attributes = [
    {
      number = "31"
      attribute_31_parameters = [
        {
          calling_station_id = "mac"
          id_mac_format      = "ietf"
          id_mac_lu_case     = "lower-case"
        }
      ]
    }
  ]
  dead_criteria_time  = 5
  dead_criteria_tries = 3
  deadtime            = 3
}
