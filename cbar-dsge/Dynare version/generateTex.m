shock_list_ =         {'_epsA', '_epsAT', '_epsAN', '_epsPO', '_epsRP', '_epsPsiTm', '_epsRStar', '_epsPiStar', '_epsM', '_epsP', '_epsMC', '_epsG'};
shock_list_captions = {'_epsA', '_epsAT', '_epsAN', '_epsPO', '_epsRP', '_epsPsiTm', '_epsRStar', '_epsPiStar', '_epsM', '_epsP', '_epsMC', '_epsG'};
%--------------------------------------------------------------------------
foldername = './images/'
filename = 'GenerateLatex.tex';
authorname = 'Elchin';
delete(filename);
%--------------------------------------------------------------------------
fid = fopen(filename, 'at');
fprintf(fid, ['\\documentclass{article}' '\n' ]);
fprintf(fid, ['\\usepackage[a4paper, margin=2.cm]{geometry}' '\n' ]); 
fprintf(fid, ['\\usepackage[utf8]{inputenc}' '\n' ]);
fprintf(fid, ['\\usepackage[inline]{enumitem}' '\n' ]);
fprintf(fid, ['\\usepackage{amsmath}' '\n' ]);
fprintf(fid, ['\\numberwithin{equation}{section}' '\n' ]);
fprintf(fid, ['\\usepackage{booktabs}' '\n' ]);
fprintf(fid, ['\\usepackage{multirow}' '\n' ]);
fprintf(fid, ['\\usepackage{breqn}' '\n' ]);
fprintf(fid, ['\\usepackage{graphicx}' '\n' ]);
fprintf(fid, ['\\graphicspath{ {%s} }' '\n' ], foldername);
fprintf(fid, ['\\title{Appendix}' '\n' ]);
fprintf(fid, ['\\author{%s}' '\n' ], authorname);
fprintf(fid, ['\\date{April 2021}' '\n' ]);
fprintf(fid, ['\\begin{document}' '\n' ]);
fprintf(fid, ['\\maketitle' '\n' ]);

for i = 1:length(shock_list_)
%--------------------------------------------------------------------------    
fprintf(fid, ['\\begin{figure}' '\n' ]);
fprintf(fid, ['\\centering' '\n' ]);
fprintf(fid, ['\\includegraphics [scale = 0.5]{irfs%s}' '\n' ], shock_list_{i});
fprintf(fid, ['\\caption{%s}' '\n' ], shock_list_captions{i});
fprintf(fid, ['\\label{fig:my_label}' '\n' ]);
fprintf(fid, ['\\end{figure}' '\n' ]);
%--------------------------------------------------------------------------
end

fprintf(fid, ['\\end{document}' '\n' ]);
fclose(fid);



