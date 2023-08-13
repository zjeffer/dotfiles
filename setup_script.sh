#####################################
# !!!!!!!! READ BEFORE USING !!!!!!!!
#
# THIS REMOVES ALL FILES IN ~/.config/ THAT MATCH WITH THE FILES IN .config 
# AND REPLACES THEM WITH SYMLINKS TO THE FILES IN .config/ 


#####################################




# for every file in .config/,
# remove the file in ~/.config/
# and link it to the file in .config/

for file in .config/*; do
	rm -rf ~/.config/$(basename $file)
	echo "Linking $file to ~/.config/$(basename $file)"
	ln -s $(pwd)/$file ~/.config/$(basename $file)
done

# do the same but for every file in this folder, excluding the folders:
for file in $(ls -ap | grep -v /); do
	rm -rf ~/$file
	echo "Linking $file to ~/$file"
	ln -sf $(pwd)/$file ~/$file
done