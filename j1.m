%1 dim schrodinger equation for arbitray potential
%parameters for solving problems in the intervel -l<x<l
l=5;n=1000;x=linspace(-l,l,n)';
dx=x(2)-x(1);

%potential choose one that make you own
%U=1/2*100*x.^2; %harmonic oscillator
U=1/2*x.^4; %quatratic potential
%finite square well of width 2w and depth given
%w=l/50;
%U=-500*((heaviside(x+w)-heaviside(x-w))
%w=l/50;a=3*w;
%U=-200*(heaviside(x+w-a)-heaviside(x-w-a)+heaviside(x+w+a)-heaviside(x-w-a));

%three-point finite difference representation of laplcian,using sparse
%matrices,where you save memory by only storing non-zero matrix element
e=ones(n,1);lap=spdiags([e -2*e e],[-1 0 1],n,n)/dx^2;

%total hamiltonian
hbar=1;m=1;
H=-1/2*(hbar^2/m)*lap+spdiags(U,0,n,n);

%find lowest nmoders eigenvalues and eigenvectors of sparse matrix
nmodes=5;options.disp=0;
[V,E]=eigs(H,nmodes,'sa',options); %find eigs
[E,ind]=sort(diag(E));  %converge E to vector and sort low to high
V=V(:,ind); %rearrange corresponding eigenvectors


%generate plot of lowest energy eigenvectors V U
Usc=U*max(abs(V(:)))/max(abs(U));  %rescale U for plotting
plot(x,V,x,Usc,'--k'); %plot u and rescaled U
%add legend showing energy of plotted V
lgnd_str=[repmat('E=',nmodes,1),num2str(E)];
legend(lgnd_str)
%shg
