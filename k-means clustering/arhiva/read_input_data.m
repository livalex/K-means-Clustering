% reads cluster count and points from input files 
function [NC points] = read_input_data(file_params, file_points)
	
	% set these values correctly
	NC = 0;
	points = [];

	% TODO read NC
  NC = load(file_params);
	% TODO read points
  points = dlmread(file_points, ' ', 5, 0);
end
% load ne va lua un singur bloc de 1 linie si 1 coloana
% dlmread va lua toate linnile si coloanelor
