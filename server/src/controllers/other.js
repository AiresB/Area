const services = require('../area/services');

const services_list = [{
            name: "",
            actions: [
                {
                    name: "",
                    description: ""
                }
            ],
            reactions: [
                {
                    name: "",
                    description: ""
                }
            ]
        },
        {
            name: "gmail",
            actions: [
                {
                    name: "Detect email",
                    description: "activate when user receive an email"
                }
            ],
            reactions: [
                {
                    name: "Send an email",
                    description: "Send an email when activate"
                }
            ]
        },
        {
            name: "google calendar",
            actions: [
                {
                    name: "Event",
                    description: "Activate when an event start"
                }
            ],
            reactions: [
                {
                    name: "Create event",
                    description: "Create an event 1 hour later the activation"
                }
            ]
        },
        {
            name: "google drive",
            actions: [
                {
                    name: "New file",
                    description: "Activate when the user create a new file"
                }
            ],
            reactions: [
                {
                    name: "Comment",
                    description: "Comment the last file pushed into the drive"
                },
                {
                    name: "Create doc",
                    description: "Create an empty google doc file into the drive"
                }
            ]
        },
        {
            name: "youtube",
            actions: [
                {
                    name: "New subscriber",
                    description: "Activate when the user got a new subscriber"
                }
            ],
            reactions: [
                {
                    name: "Like",
                    description: "Like the TOP 1 Popular FR video"
                },
                {
                    name: "Playlist",
                    description: "Put the TOP 1 Popular FR video in a Playlist"
                }
            ]
        },
        {
            name: "weather",
            actions: [
                {
                    name: "Rain",
                    description: "Activate when it start to rain"
                }
            ],
            reactions: []
        },
        {
            name: "sunrise-sunset",
            actions: [
                {
                    name: "Sunrise",
                    description: "Activate at sunrise"
                },
                {
                    name: "Sunset",
                    description: "Activate at sunset"
                }
            ],
            reactions: []
        },
        {
            name: "Holidays",
            actions: [
                {
                    name: "Holidays",
                    description: "Activate each morning during the french holidays"
                }
            ],
            reactions: []
        },
        {
            name: "Hour",
            actions: [
                {
                    name: "8 o'clock",
                    description: "activate each morning at 8 o'clock"
                }
            ],
            reactions: []
        },
    ]



exports.about = async (req, res) => {
    const ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress;
    const time = Date.now();
    const client = {host: ip};
    const serveur = {current_time: time, services: services_list}
    res.status(200).json({client: client, serveur: serveur});
}
