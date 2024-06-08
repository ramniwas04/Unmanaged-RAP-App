
@EndUserText.label: 'Booking Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true

@Search.searchable: true
define view entity ZC_Booking_tech_U 
  as projection on ZI_BOOKING_TECH_U

{    
      @Search.defaultSearchElement: true
  key TravelID,
 
      @Search.defaultSearchElement: true
  key BookingID,

      BookingDate,

      @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Customer_StdVH', element: 'CustomerID' }, useForValidation: true}]
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['CustomerName']
      CustomerID,
      _Customer.LastName    as CustomerName,

      @ObjectModel.text.element: ['CarrierName']
      @Consumption.valueHelpDefinition: [ 
          { entity: {name: '/DMO/I_Flight_StdVH', element: 'AirlineID'},
            additionalBinding: [ { localElement: 'FlightDate',   element: 'FlightDate',   usage: #RESULT},
                                 { localElement: 'ConnectionID', element: 'ConnectionID', usage: #RESULT},
                                 { localElement: 'FlightPrice',  element: 'Price',        usage: #RESULT},
                                 { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT } ], 
            useForValidation: true }
        ]
      AirlineID,
      _Carrier.Name      as CarrierName,

      @Consumption.valueHelpDefinition: [ 
          { entity: {name: '/DMO/I_Flight_StdVH', element: 'ConnectionID'},
            additionalBinding: [ { localElement: 'FlightDate',   element: 'FlightDate',   usage: #RESULT},
                                 { localElement: 'AirlineID',    element: 'AirlineID',    usage: #FILTER_AND_RESULT},
                                 { localElement: 'FlightPrice',  element: 'Price',        usage: #RESULT},
                                 { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT } ], 
            useForValidation: true }
        ]
      ConnectionID,


      @Consumption.valueHelpDefinition: [ 
          { entity: {name: '/DMO/I_Flight_StdVH', element: 'FlightDate'},
            additionalBinding: [ { localElement: 'AirlineID',    element: 'AirlineID',    usage: #FILTER_AND_RESULT},
                                 { localElement: 'ConnectionID', element: 'ConnectionID', usage: #FILTER_AND_RESULT},
                                 { localElement: 'FlightPrice',  element: 'Price',        usage: #RESULT},
                                 { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT } ], 
            useForValidation: true }
        ]
      FlightDate,

      @Consumption.valueHelpDefinition: [ 
          { entity: {name: '/DMO/I_Flight_StdVH', element: 'Price'},
            additionalBinding: [ { localElement: 'FlightDate',   element: 'FlightDate',   usage: #FILTER_AND_RESULT},
                                 { localElement: 'AirlineID',    element: 'AirlineID',    usage: #FILTER_AND_RESULT},
                                 { localElement: 'ConnectionID', element: 'ConnectionID', usage: #FILTER_AND_RESULT},
                                 { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT } ], 
            useForValidation: true }
        ]
      FlightPrice,
      
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }, useForValidation: true }]
      CurrencyCode,
      
//      LastChangedAt,
      /* Associations */

      _Travel: redirected to parent ZC_Travel_tech_U,
//      _BookSupplement: redirected to composition child ,
      _Carrier,
      _Connection,
      _Customer
}
