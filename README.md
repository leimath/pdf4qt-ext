## Pdf4Qt-ext

> [!WARNING]
> Not an installer! Just an extractor

It is a handy script to extract the tool from https://github.com/JakubMelka ,[Pdf4Qt](https://github.com/JakubMelka/PDF4QT) appimage. It is a really cool pdf viewer/editor with a lot of good features.

Rationale:

1. Appimage is fine however I prefer to call the tool from the terminal on file basis and would like to open whatever i want in an instant for example: `Pdf4QtViewer one.pdf` to open the viewer and `Pdf4QtEditor one.pdf` to open the editor.
2. Allows creation of `.desktop` file to easy defaulting.
3. Flatpak on fedora was broken and I did not want a Flatpak. It is not on the official package manager.

> [!NOTE]
> It requires manual intervention to fetch the URL for the appimage as well to give permissions to the appimage to extract it.
> You MUST manually add the directory string to PATH for this to work. 


### Installation

1. Grab the latest release URL **for the appimage** from the [REALEASE URL](https://github.com/JakubMelka/PDF4QT/releases)
2. git clone this repo.
3. Give permissions to the script using `chmod u+x install.sh`
4. Run the script with `./install.sh`
5. When prompted for the URL, paste the copied URL **for the appimage**.
6. When prompted for permissions for extraction press `y` to start extraction. Press `N` if you do not want to extract. It will exit.
7. Read the last lines to your `PATH` variable in your `.bashrc` and source it with `source .bashrc`.
8. You can now call all the exectuable manually.

### TODO:

1. Implement auto fetching of versions.
2. Ability to generate `.desktop` files. 

### How to add to path?

1. Open `~/.bashrc` in your favourite text editor. Go to the end.
2. Now type `export PATH=$PATH:<<< String that the tool gave you after execution >>>`
3. Exit your text editor. Now type `source ~/.bashrc`.

### How to uninstall Pdf4Qt?

Simply delete the `~/.TOOLS` directory. It is where the extracted files are kept.