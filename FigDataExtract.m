if(~isdeployed)
  cd(fileparts(which(mfilename)));
end
DataPath = '.\';
AvailableFiles = dir((fullfile(DataPath, '*.fig'))); % list available data files

for idx = 1: size(AvailableFiles,1)
    OpenFileName = AvailableFiles(idx).name;
    gUI = 'gui.fig';
    if strcmp(OpenFileName, gUI)
        break;
    end
    disp(OpenFileName);
    fig = openfig(OpenFileName);
    Ozone = fig.Children.Children.ZData;
    
    Name = strsplit(OpenFileName,'.');
    writematrix(Ozone, strcat(Name{1},'.csv'))
    close(fig);
end