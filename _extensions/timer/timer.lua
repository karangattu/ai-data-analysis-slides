-- Countdown Timer Shortcode for Quarto RevealJS
-- Usage: {{< timer 5 >}} for 5 minutes
-- Usage: {{< timer 5 30 >}} for 5 minutes 30 seconds
-- Usage: {{< timer 0 45 >}} for 45 seconds only
-- Usage: {{< timer 5 size="large" >}} for large timer
-- Usage: {{< timer 5 warn="30" >}} to warn at 30 seconds remaining

-- Generate unique ID for each timer instance
local timer_count = 0
local function getTimerId()
  timer_count = timer_count + 1
  return "countdown-timer-" .. timer_count
end

return {
  ["timer"] = function(args, kwargs)
    -- Only works for HTML/RevealJS output
    if not quarto.doc.is_format("html:js") then
      return pandoc.Null()
    end
    
    -- Parse positional arguments
    local minutes = 0
    local seconds = 0
    
    if #args >= 1 then
      minutes = tonumber(pandoc.utils.stringify(args[1])) or 0
    end
    if #args >= 2 then
      seconds = tonumber(pandoc.utils.stringify(args[2])) or 0
    end
    
    -- Parse optional kwargs
    local warn_time = 60  -- default: warn at 60 seconds remaining
    if kwargs["warn"] then
      warn_time = tonumber(pandoc.utils.stringify(kwargs["warn"])) or 60
    end
    
    local size = "normal"  -- small, normal, large
    if kwargs["size"] then
      size = pandoc.utils.stringify(kwargs["size"])
    end
    
    -- Calculate total seconds
    local total_seconds = (minutes * 60) + seconds
    
    -- Generate unique ID
    local timer_id = getTimerId()
    
    -- Size classes
    local size_class = "timer-normal"
    if size == "small" then
      size_class = "timer-small"
    elseif size == "large" then
      size_class = "timer-large"
    end
    
    -- Format initial display
    local display_min = math.floor(total_seconds / 60)
    local display_sec = total_seconds % 60
    local initial_display = string.format("%02d:%02d", display_min, display_sec)
    
    -- Generate HTML with embedded CSS and JavaScript
    local html = string.format([[
<div id="%s" class="countdown-timer %s" data-total="%d" data-warn="%d">
  <style>
    .countdown-timer {
      display: inline-flex;
      align-items: center;
      gap: 0.6em;
      font-family: 'JetBrains Mono', 'Fira Code', 'Consolas', monospace;
      background: #1e293b;
      border: 1px solid #334155;
      border-radius: 8px;
      padding: 0.5em 1em;
      margin: 0.5em 0;
    }
    .countdown-timer.timer-small {
      font-size: 0.8em;
      padding: 0.3em 0.6em;
    }
    .countdown-timer.timer-normal {
      font-size: 1.1em;
    }
    .countdown-timer.timer-large {
      font-size: 1.8em;
      padding: 0.6em 1.2em;
    }
    .countdown-timer .timer-display {
      font-weight: 600;
      color: #e2e8f0;
      min-width: 4em;
      text-align: center;
    }
    .countdown-timer.warning .timer-display {
      color: #f59e0b;
    }
    .countdown-timer.finished .timer-display {
      color: #ef4444;
    }
    .countdown-timer.running {
      border-color: #10b981;
    }
    .countdown-timer.running .timer-display {
      color: #10b981;
    }
    .countdown-timer.paused {
      border-color: #f59e0b;
    }
    .countdown-timer .timer-btn {
      background: #334155;
      border: none;
      border-radius: 6px;
      padding: 0.3em 0.6em;
      cursor: pointer;
      font-size: 0.85em;
      color: #e2e8f0;
      transition: background 0.2s ease;
    }
    .countdown-timer .timer-btn:hover {
      background: #475569;
    }
    .countdown-timer .timer-icon {
      font-size: 0.9em;
      opacity: 0.8;
    }
  </style>
  <span class="timer-icon">⏱️</span>
  <span class="timer-display">%s</span>
  <button class="timer-btn timer-start" onclick="toggleTimer('%s')" title="Start/Pause">▶️</button>
  <button class="timer-btn timer-reset" onclick="resetTimer('%s')" title="Reset">🔄</button>
</div>
<script>
(function() {
  const timers = window.countdownTimers = window.countdownTimers || {};
  
  window.toggleTimer = function(id) {
    const el = document.getElementById(id);
    if (!el) return;
    
    const timer = timers[id] = timers[id] || {
      total: parseInt(el.dataset.total),
      remaining: parseInt(el.dataset.total),
      warn: parseInt(el.dataset.warn),
      interval: null,
      running: false
    };
    
    if (timer.running) {
      // Pause
      clearInterval(timer.interval);
      timer.running = false;
      el.classList.remove('running');
      el.classList.add('paused');
      el.querySelector('.timer-start').textContent = '▶️';
    } else {
      // Start
      if (timer.remaining <= 0) {
        timer.remaining = timer.total;
        el.classList.remove('finished', 'warning');
      }
      timer.running = true;
      el.classList.remove('paused', 'finished');
      el.classList.add('running');
      el.querySelector('.timer-start').textContent = '⏸️';
      
      timer.interval = setInterval(function() {
        timer.remaining--;
        updateTimerDisplay(id);
        
        if (timer.remaining <= timer.warn && timer.remaining > 0) {
          el.classList.add('warning');
        }
        
        if (timer.remaining <= 0) {
          clearInterval(timer.interval);
          timer.running = false;
          el.classList.remove('running', 'warning');
          el.classList.add('finished');
          el.querySelector('.timer-start').textContent = '▶️';
        }
      }, 1000);
    }
  };
  
  window.resetTimer = function(id) {
    const el = document.getElementById(id);
    if (!el) return;
    
    const timer = timers[id] = timers[id] || {
      total: parseInt(el.dataset.total),
      remaining: parseInt(el.dataset.total),
      warn: parseInt(el.dataset.warn),
      interval: null,
      running: false
    };
    
    clearInterval(timer.interval);
    timer.remaining = timer.total;
    timer.running = false;
    el.classList.remove('running', 'paused', 'warning', 'finished');
    el.querySelector('.timer-start').textContent = '▶️';
    updateTimerDisplay(id);
  };
  
  function updateTimerDisplay(id) {
    const el = document.getElementById(id);
    if (!el) return;
    
    const timer = timers[id];
    const min = Math.floor(timer.remaining / 60);
    const sec = timer.remaining %% 60;
    el.querySelector('.timer-display').textContent = 
      String(min).padStart(2, '0') + ':' + String(sec).padStart(2, '0');
  }
})();
</script>
]], timer_id, size_class, total_seconds, warn_time, initial_display, timer_id, timer_id)

    return pandoc.RawInline('html', html)
  end
}
