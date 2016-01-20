cd $WERCKER_CACHE_DIR

command_exists()
{
  hash "$1" 2>/dev/null
}

if ! command_exists unzip; then
  sudo apt-get update
  sudo apt-get install -y unzip
fi

if [ -f "$WERCKER_CACHE_DIR/go_appengine/appcfg.py" ]; then
  debug "appcfg.py found in cache"
else
  debug "Downloading AppEngine SDK..."
  export FILE=$(curl https://storage.googleapis.com/appengine-sdks/ | grep -o 'featured/go_appengine_sdk_linux_amd64-[^\<]*' | tail -1)
  curl -O https://storage.googleapis.com/appengine-sdks/$FILE

  debug "Extracting..."
  unzip -q `echo $FILE | awk -F / '{print $2}'`
fi

cd $WERCKER_SOURCE_DIR

debug "Starting deployment"
$WERCKER_CACHE_DIR/go_appengine/appcfg.py update "$WERCKER_SOURCE_DIR" --oauth2_refresh_token="$WERCKER_APPENGINE_DEPLOY_TOKEN"

success "Finished"
