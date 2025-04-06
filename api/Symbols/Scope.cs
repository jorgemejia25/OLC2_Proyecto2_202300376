public class Scope
{

    private static readonly Dictionary<string, int> _scopeCounters = new();

    

    public static string GenerateScopeName(string prefix)
    {
        if (!_scopeCounters.ContainsKey(prefix))
        {
            _scopeCounters[prefix] = 0;
        }

        _scopeCounters[prefix]++;
        return $"{prefix}{_scopeCounters[prefix]}";
    }
}
