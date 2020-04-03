using Microsoft.AspNetCore.Mvc;

namespace Translator
{
    public class translator : Controller
    {
        [HttpGet] 
        public async Task<ActionResult<IEnumerable<User»> Get() 
        { 
            return await db.Users.ToListAsync(); 
        }
        
    }
}