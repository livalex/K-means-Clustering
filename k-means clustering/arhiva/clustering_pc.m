% computes the NC centroids corresponding to the given points using K-Means
function centroids = clustering_pc(points, NC)
    centroids = [];
	% TODO K-Means code
    maxiter = 135;
    % initializeaza matricea cu o matrice de 0-uri, cu NC randuri
    % si nr de coloane ale lui points
    nrcol = length(points(1, :));
    centroids = zeros(NC,nrcol);
    % realizeaza un vector cu lungimea egala cu nr de linii din
    % ponits aranjate random
    veclen = length(points(:,1));
    random = randperm(veclen);
    % ia NC elemente din random si le folos ca indicii liniilor,
    % coloanele fiind luate cu totul. Astfel primii centroizi vor fi
    % alesi random din inputul de pucnte
    var = random(1 : 1 :NC);
    centroids = points(var, :);
  
    % nr de centroizi
    L = length(centroids(:,1));
    % matrice care ne spune carui cluster apartine punctul
    indmat = zeros(veclen,1);
    %nr punctelor
    n = veclen;
    for iterations = 1 : maxiter;
         % totalsize va fi nr de centroizi,iar totalcluster va fi
         % va fi suma coordonatelor punctelor din input
            totalcluster = zeros(NC, nrcol);
            totalsize = zeros(NC, 1);
        % parcurgem toate liniile fis de intrare
        for i = 1 : 1 : n
            % luam o variabila care stocheaza carui cluster apartine punctul
            l = 1;
            % pt a lua toate liniile
            alllines = points(i,:);
            % vom face formula euclidiana cu primul cluster si vom presupune
            % ca dist de la primul punct la primul centroid e cea mai mica
            mindistance = sum((alllines - centroids(1,:)) .^ 2);
            for j = 2 : 1 : L
                % pt a trece prin celelalte puncte din matr de centroizi
                centrlines = centroids(j,:);
                % calculam distanta de la punct la al doilea centroid
                distance = sum((alllines - centrlines) .^ 2);
                % daca distanta de la punct la primul centroid e mi mare
                % decat distanta de la pct la alt centroid,schimbam minimul
                if (mindistance > distance)
                    mindistance = distance;
                    l = j;
                endif
            end
            % pt a ne arata de ce centroid apartine fiecare punct
            indmat(i) = l;
            % pt a face suma coordonatelor punctelor care apartin unui cluster
            totalcluster(l, :) =  totalcluster(l, :) + points(i, :);
            % pt a determina nr de aparitii a unui centroid
            totalsize (l) = totalsize(l) + 1;
        end
        newcentroids = zeros(NC,length(points(1,:)));
        for i = 1 : NC
            % calculam centrul de greutate al noului centroid
            newcentroids(i, :) = totalcluster(i,:) / totalsize(i);
        end
        % daca diferenta dintre ele este foarte mica,consideram ca 
        % pct-ele nu si-au schimbat centrul de greutate
        if sum(sum(abs(newcentroids - centroids))) < eps
            break;
        endif
        centroids = newcentroids;
    end
    indmat = indmat';
end