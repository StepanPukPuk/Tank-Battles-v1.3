const { app, BrowserWindow, Menu, globalShortcut } = require('electron');
const path = require('path');

function createWindow() {
  const win = new BrowserWindow({
    width: 1280,
    height: 800,
    fullscreen: true,
    backgroundColor: '#000000',
    title: 'Танковый бой',
    autoHideMenuBar: true,
    webPreferences: { autoplayPolicy: 'no-user-gesture-required' }
  });
  Menu.setApplicationMenu(null);
  win.loadFile(path.join(__dirname, 'game', 'index.html'));

  win.webContents.on('before-input-event', (e, input) => {
    if (input.type !== 'keyDown') return;
    if (input.key === 'F11') { win.setFullScreen(!win.isFullScreen()); e.preventDefault(); }
    if (input.key === 'F4' && input.alt) { app.quit(); }
  });
}

app.whenReady().then(createWindow);
app.on('window-all-closed', () => app.quit());
