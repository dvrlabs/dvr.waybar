MIC_NAME='alsa_input.usb-GeneralPlus_USB_Audio_Device-00.mono-fallback'

# Check mute status
MUTE_STATUS=$(pactl list sources | awk -v name="$MIC_NAME" '/Name:/{flag=0} $0 ~ name {flag=1} flag && /Mute:/ {print $2; exit}')

if [ "$MUTE_STATUS" = 'yes' ]; then
    echo "🔇"
else
    echo "🎤"
fi

