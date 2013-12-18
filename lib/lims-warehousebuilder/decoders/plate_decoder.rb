require 'lims-warehousebuilder/json_decoder'
require 'lims-warehousebuilder/decoders/transfer_shared'

module Lims::WarehouseBuilder
  module Decoder
    class PlateDecoder < JsonDecoder

      include TransferShared
      include ContainerResourceShared

    end
  end
end
