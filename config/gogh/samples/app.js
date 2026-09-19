// Sample for the `colors` theme preview — syntax via bat.
export function serve(name) {
  const port = 8000;
  if (!name) {
    return null;
  }
  // greet and log the port we listen on
  console.log(`Hello ${name}, listening on ${port}`);
}
