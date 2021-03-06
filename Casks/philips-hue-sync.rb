cask 'philips-hue-sync' do
  version :latest
  sha256 :no_check

  # flex1548-esd.flexnetoperations.com/flexnet/operations was verified as official when first introduced to the cask
  url 'https://flex1548-esd.flexnetoperations.com/flexnet/operations/WebContent?fileID=HueSyncMac'
  name 'Philips Hue Sync'
  homepage 'https://www2.meethue.com/en-us/entertainment/hue-sync'

  container type: :naked

  pkg 'philips-hue-sync.pkg'

  # This is a horrible hack to force the file extension.
  # The backend code should be fixed so that this is not needed.
  preflight do
    system_command '/bin/mv', args: ['--', staged_path.join('WebContent'), staged_path.join('philips-hue-sync.pkg')]
  end

  uninstall pkgutil: 'com.lighting.huesync'
end
