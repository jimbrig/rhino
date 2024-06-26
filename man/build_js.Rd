% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tools.R
\name{build_js}
\alias{build_js}
\title{Build JavaScript}
\usage{
build_js(watch = FALSE)
}
\arguments{
\item{watch}{Keep the process running and rebuilding JS whenever source files change.}
}
\value{
None. This function is called for side effects.
}
\description{
Builds the \code{app/js/index.js} file into \code{app/static/js/app.min.js}.
The code is transformed and bundled
using \href{https://babeljs.io}{Babel} and \href{https://webpack.js.org}{webpack},
so the latest JavaScript features can be used
(including ECMAScript 2015 aka ES6 and newer standards).
Requires Node.js and the \code{yarn} command to be available on the system.
}
\details{
Functions/objects defined in the global scope do not automatically become \code{window} properties,
so the following JS code:\if{html}{\out{<div class="sourceCode js">}}\preformatted{function sayHello() \{ alert('Hello!'); \}
}\if{html}{\out{</div>}}

won't work as expected if used in R like this:\if{html}{\out{<div class="sourceCode r">}}\preformatted{tags$button("Hello!", onclick = 'sayHello()');
}\if{html}{\out{</div>}}

Instead you should explicitly export functions:\if{html}{\out{<div class="sourceCode js">}}\preformatted{export function sayHello() \{ alert('Hello!'); \}
}\if{html}{\out{</div>}}

and access them via the global \code{App} object:\if{html}{\out{<div class="sourceCode r">}}\preformatted{tags$button("Hello!", onclick = "App.sayHello()")
}\if{html}{\out{</div>}}
}
\examples{
if (interactive()) {
  # Build the `app/js/index.js` file into `app/static/js/app.min.js`.
  build_js()
}
}
