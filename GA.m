
function GA()
    % Define inputs
    nvar = 2;
    fun = @Shubert2;

    % Set nondefault solver options
    options = optimoptions("ga",...
        "PopulationSize",50,...
        "CreationFcn","gacreationuniform",...
        "CrossoverFcn","crossovertwopoint",...
        "SelectionFcn","selectiontournament",...
        "MutationFcn","mutationadaptfeasible",...
        "MaxGenerations",200,...
        "Display","iter",...
        "PlotFcn",[...
            "gaplotdistance",...
            "gaplotgenealogy",...
            "gaplotselection",...
            "gaplotscorediversity",...
            "gaplotscores",...
            "gaplotstopping",...
            "gaplotbestf",...
            "gaplotbestindiv",...
            "gaplotexpectation",...
            "gaplotrange"...
        ]...
    );

    % Solve
    [solution,objectiveValue] = ga(fun,nvar,[],[],[],[],repmat(-10,nvar,1),...
    repmat(10,nvar,1),[],[],options);

    % Clear variables
    clearvars options
end

function y = Shubert2(x)
    n = length(x);
    p = 1.0;
    for i = 1: n
        s = 0.0;
        for j = 1:5
            s = s+j.*cos((j+1).*x(i)+j);
        end
        p = p.*s;
    end
    y = p + (0.5 * ((x(1) + 1.42513).^2 + (x(2) + 0.80032).^2));
end
