require 'lims-warehousebuilder/json_decoder'
require 'lims-warehousebuilder/decoders/transfer_shared'

module Lims::WarehouseBuilder
  module Decoder
    class PlateDecoder < JsonDecoder

      include TransferShared

      private

      def _call(options)
        plate_uuid = @payload["uuid"]
        transfers = get_transfers

        if transfers && resource_uuids(transfers).include?(plate_uuid)
          # Set the force_save token to force the update of the plate
          force_save!
        end

        super
      end

      def resource_uuids(transfers)
        uuids = []
        transfers.each do |transfer|
          uuids.merge!(transfer.map do |key, value|
            value if key.match(/uuid/)
          end)
        end
        uuids.compact
      end

    end
  end
end