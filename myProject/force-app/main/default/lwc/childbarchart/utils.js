/* NOTE: This is a clone function that will fail for recursive structures
 * and most non-primitive objects, as they require special care in
 * handling. The point of this function is only to demonstrate how to
 * clone basic data structures so they can be used with basic third-party
 * libraries, in this case, ChartJS.
 */
export function clone(source) {
    // Stop here for some types
    if(source === undefined || source === null || source instanceof Function) {
      return source;
    }
    // Recursively copy every element in array
    if(Array.isArray(source)) {
      return source.map((item)=>clone(item));
    }
    // Recursively copy every property we can
    if(typeof source === 'object') {
      return Object.fromEntries(
        Object.entries(source).map(
          ([key, value]) => ([ key, clone(value)])
        )
      );
    }
    return source;
  }