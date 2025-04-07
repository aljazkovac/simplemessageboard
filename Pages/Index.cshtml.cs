using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

public class IndexModel : PageModel
{
    private static List<Message> _messages = new List<Message>();

    [BindProperty]
    public required string NewMessage { get; set; }

    public List<Message> Messages => _messages;

    public void OnGet()
    {
    }

    public IActionResult OnPost()
    {
        if (!string.IsNullOrWhiteSpace(NewMessage))
        {
            _messages.Add(new Message 
            { 
                Text = NewMessage, 
                PostedAt = DateTime.Now 
            });
            NewMessage = string.Empty;
        }
        return Page();
    }
}